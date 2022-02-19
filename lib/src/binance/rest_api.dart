import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;

import 'package:dashchain/dashchain.dart';

/// Based on official docs at https://github.com/binance-exchange/binance-official-api-docs
class BinanceRestApi {
  static BinanceRestApi? _instance;

  BinanceRestApi._(
    this.apiKey,
    this.apiSecretKey,
  ) {
    _apiClient = http.Client();
    _instance = this;
    _log('API manager initialized !');
  }

  factory BinanceRestApi() => _instance ?? BinanceRestApi._(null, null);

  factory BinanceRestApi.withKeys({
    required String apiKey,
    required String apiSecretKey,
  }) =>
      _instance ?? BinanceRestApi._(apiKey, apiSecretKey);

  /// Will dispose any resources used by this class
  void dispose() => _apiClient.close();

  /// The HTTP Client  used to make requests
  late http.Client _apiClient;

  /// Exposing setter for mocking capabilities in unit tests
  set apiClient(http.Client client) => _apiClient = client;

  /// The user's API key
  String? apiKey;

  /// The user's API **secret** key
  String? apiSecretKey;

  /// This variable will track the current IP used weight, that _- if high enough -_ may mean that too many requests has been done.
  ///
  /// Because it can lead to IP ban, we have to be careful with this.
  int get usedWeight => _usedWeight;
  int _usedWeight = 0;

  /// A [Stopwatch] to log requests duration (may remove before production use, or have an opt-in toggle)
  static late final Stopwatch _stopwatch = Stopwatch();

  /// Will reset [_stopwatch] and restart it
  void _restartStopwatch() {
    _stopwatch.stop();
    _stopwatch.reset();
    _stopwatch.start();
  }

  /// A simple log method (may integrate logging pkg later)
  void _log(String msg) => print('[$runtimeType] $msg');

  /// Will build an [Uri] based on params and send a request via the [_apiClient].
  ///
  /// If any errors occurs (HTTP code 4XX, unexpected body format, ...), it will throw a [BinanceApiError].
  @visibleForTesting
  Future<dynamic> sendRequest(
    String baseUri,
    String resourcePath, {
    RequestMethod requestMethod = RequestMethod.get,
    Map<String, dynamic>? queryParameters,
    bool withKey = false,
    bool withSignature = false,
  }) async {
    if (withSignature) withKey = true;
    Map<String, String>? headers;
    if (withKey) {
      if (null == apiKey) {
        throw const BinanceApiError(-1, 'apiKey must not be null');
      }
      headers = {xMbxApiKeyHeader: apiKey!};
    }
    if (withSignature) {
      if (null == apiSecretKey) {
        throw const BinanceApiError(-1, 'apiSecretKey must not be null');
      }
      queryParameters ??= <String, dynamic>{};
      queryParameters['timestamp'] = '${DateTime.now().millisecondsSinceEpoch}';
      String totalParams = Uri.https('', '', queryParameters).query;
      queryParameters['signature'] = computeSignature(totalParams);
    }
    final uri = Uri.https(
      baseUri,
      '$apiPath$resourcePath',
      queryParameters,
    );
    http.Response response;
    _log('${requestMethod.value} $uri');
    _restartStopwatch();
    switch (requestMethod) {
      case RequestMethod.get:
        response = await _apiClient.get(uri, headers: headers);
        break;
      case RequestMethod.post:
        response = await _apiClient.post(uri, headers: headers);
        break;
    }
    _log('received answer after ${_stopwatch.elapsedMilliseconds}ms.');
    switch (response.statusCode) {
      case 200:
        maybeUpdateUsedWeight(response.headers);
        dynamic result;
        try {
          result = jsonDecode(response.body);
        } on FormatException catch (e) {
          final error = BinanceApiError(-1, e);
          _log('caught error during request...$error');
          throw error;
        }
        // sometimes the response is an error (https://github.com/binance/binance-spot-api-docs/blob/master/errors.md)
        if (result is Map && result.containsKey('code')) {
          final code = result['code'] as int;
          final error = BinanceApiError(code, result['msg']);
          _log('caught error during request...$error');
          throw error;
        }
        return result;
      default:
        final error =
            BinanceApiError(response.statusCode, response.reasonPhrase);
        _log('caught error during request...$error');
        throw error;
    }
  }

  /// Will check response's headers to update the current requests quota.
  @visibleForTesting
  void maybeUpdateUsedWeight(Map<String, String> headers) {
    if (headers.containsKey(xMbxUsedWeightHeader)) {
      final weightAsString = headers[xMbxUsedWeightHeader]!;
      try {
        _usedWeight = int.parse(weightAsString);
        _log('updated used weight : $_usedWeight');
      } catch (e) {
        _log('unexpected format for weight $weightAsString');
      }
    } else {
      _log('used weight header not found');
    }
  }

  @visibleForTesting
  String computeSignature(String totalParams) {
    _log('computeSignature($totalParams)');
    List<int> hmacInput = utf8.encode(apiSecretKey!);
    final hmacSha256 = Hmac(sha256, hmacInput); // HMAC-SHA256
    final totalParamsBytes = utf8.encode(totalParams);
    final signature = hmacSha256.convert(totalParamsBytes);
    _log('signing request with: $signature');
    return '$signature';
  }

  /// As per Binance's docs, there are 3 more clusters for API calls with names `api1`, `api2` and `api3`.
  ///
  /// Returns a fallback URI from one of these 3 clusters.
  ///
  /// Throws a [BinanceApiError] if an error occurs or if none of the clusters are available.
  Future<String> getFallbackUri() async {
    _log('will try to find a fallback endpoint');
    String? fallbackUri;
    for (var i = 1; i < 4; i++) {
      final candidateUri = 'api$i.$binanceDomain';
      final ping = await _ping(candidateUri);
      if (ping) {
        _log('found a fallback URI at $candidateUri');
        fallbackUri = candidateUri;
        break;
      }
    }
    if (fallbackUri != null) {
      return fallbackUri;
    } else {
      throw const BinanceApiError(-1, 'no fallback URI found');
    }
  }

  /// Will check for Binance's _REST API_ availability using `/ping` endpoint as recommended.
  ///
  /// API Key required : no
  ///
  /// Query weight : 1
  ///
  /// Returns :
  /// - `true` when request is a success
  /// - `false` otherwise
  Future<bool> ping({String baseUri = defaultUri}) async => _ping(baseUri);

  /// This private method helps to reuse ping in [getFallbackUri].
  Future<bool> _ping(String baseUri) async {
    try {
      await sendRequest(baseUri, pingPath);
      return true;
    } on BinanceApiError catch (_) {
      return false;
    }
  }

  /// Will get Binance's _REST API_ server time using `/time` endpoint.
  ///
  /// API Key required : no
  ///
  /// Query weight : 1
  ///
  /// Returns the _Epoch time_ in milliseconds when request is a success.
  ///
  /// Throws a [BinanceApiError] if an error occurs.
  Future<int> checkApiTime({String baseUri = defaultUri}) async =>
      (await sendRequest(baseUri, timePath))['serverTime'];

  /// Will get by default all Binance's listed symbols using `/exchangeInfo` endpoint.
  /// If [symbols] is provided, will append query parameter to the GET request in order to filter the result.
  ///
  /// API Key required : no
  ///
  /// Query weight : 10
  ///
  /// Returns a [BinanceExchangeInfo] containing all returned data when request is a success.
  ///
  /// Throws a [BinanceApiError] if an error occurs.
  Future<BinanceExchangeInfo> exchangeInfo({
    String baseUri = defaultUri,
    List<String> symbols = const <String>[],
  }) async =>
      BinanceExchangeInfo.fromJson(await sendRequest(
        baseUri,
        exchangeInfoPath,
        queryParameters: _buildExchangeInfoParams(symbols),
      ));

  /// Helper method to build the necessary [Map] used as query parameter on [exchangeInfoPath] endpoint.
  Map<String, String>? _buildExchangeInfoParams(List<String> symbols) {
    Map<String, String>? params;
    if (symbols.isNotEmpty) {
      // should add query parameter
      String key;
      dynamic value;
      if (symbols.length == 1) {
        // ex: `?symbol=BNBETH`
        key = 'symbol';
        value = symbols.first;
      } else {
        // ex: `?symbols=["BNBETH","BNBBTC"]`
        key = 'symbols';
        final _symbols = StringBuffer('[');
        for (final s in symbols) {
          _symbols.write('"$s"');
          if (symbols.last != s) _symbols.write(',');
        }
        _symbols.write(']');
        value = '$_symbols';
      }
      params = {key: value};
    } else {
      // should use default endpoint
    }
    return params;
  }

  /// Will get a specific symbol's order book using `/depth` endpoint.
  /// If [limit] is provided, will modify the max number of bids/asks returned and the query weight. (defaults to 100)
  ///
  /// API Key required : no
  ///
  /// Valid limit values and associated query weight :
  ///
  /// |        Limit       |  Weight |
  /// | :----------------: | :------ |
  /// | 5, 10, 20, 50, 100 |    1    |
  /// |        500         |    5    |
  /// |        1000        |    10   |
  /// |        5000        |    50   |
  ///
  ///
  /// Returns a [BinanceOrderBook] containing all returned data when request is a success.
  ///
  /// Throws a [BinanceApiError] if an error occurs.
  Future<BinanceOrderBook> orderBook({
    String baseUri = defaultUri,
    required String symbol,
    int limit = 100,
  }) async =>
      BinanceOrderBook.fromJson(await sendRequest(
        baseUri,
        orderBookPath,
        queryParameters: {'symbol': symbol, 'limit': '$limit'},
      ));

  /// Will get a specific symbol's latests trades using `/trades` endpoint.
  /// If [limit] is provided, will modify the max number of trades returned. (defaults to 100)
  ///
  /// API Key required : no
  ///
  /// Query weight : 1
  ///
  /// Returns a list of [BinanceTrade] containing all returned data when request is a success.
  ///
  /// Throws a [BinanceApiError] if an error occurs.
  Future<List<BinanceTrade>> trades({
    String baseUri = defaultUri,
    required String symbol,
    int limit = 100,
  }) async {
    final trades = await sendRequest(
      baseUri,
      tradesPath,
      queryParameters: {'symbol': symbol, 'limit': '$limit'},
    );
    if (trades is List) {
      final _trades = <BinanceTrade>[];
      for (final trade in trades) {
        _trades.add(BinanceTrade.fromJson(trade));
      }
      return _trades;
    } else {
      throw const BinanceApiError(-1, 'unexpected trades format');
    }
  }

  /// Will get a specific symbol's historical trades using `/historicalTrades` endpoint.
  /// If [limit] is provided, will modify the max number of trades returned. (defaults to 100)
  ///
  /// API Key required : yes
  ///
  /// Query weight : 5
  ///
  /// Returns a list of [BinanceTrade] containing all returned data when request is a success.
  ///
  /// Throws a [BinanceApiError] if an error occurs.
  Future<List<BinanceTrade>> historicalTrades({
    String baseUri = defaultUri,
    required String symbol,
    int limit = 100,
    int? fromId,
  }) async {
    Map<String, String> params = {'symbol': symbol, 'limit': '$limit'};
    if (fromId != null) {
      params['fromId'] = '$fromId';
    }
    final historicalTrades = await sendRequest(
      baseUri,
      historicalTradesPath,
      queryParameters: params,
      withKey: true,
    );
    if (historicalTrades is List) {
      return List<BinanceTrade>.from(
        historicalTrades.map((t) => BinanceTrade.fromJson(t)),
      );
    } else {
      throw const BinanceApiError(-1, 'unexpected trades format');
    }
  }

  /// Will get a specific symbol's aggregated trades using `/aggTrades` endpoint.
  /// If [limit] is provided, will modify the max number of trades returned. (defaults to 100)
  ///
  /// API Key required : no
  ///
  /// Query weight : 1
  ///
  /// Returns a list of [BinanceAggregatedTrade] containing all returned data when request is a success.
  ///
  /// Throws an [ArgumentError] if difference between start and end times is more than 1 hour.
  /// Throws a [BinanceApiError] if any other error occurs.
  Future<List<BinanceAggregatedTrade>> aggregatedTrades({
    String baseUri = defaultUri,
    required String symbol,
    int limit = 100,
    int? fromId,
    DateTime? startTime,
    DateTime? endtime,
  }) async {
    Map<String, String> params = {'symbol': symbol, 'limit': '$limit'};
    if (fromId != null) {
      params['fromId'] = '$fromId';
    }
    if (startTime != null) {
      if (endtime != null) {
        if (endtime.difference(startTime).inHours >= 1) {
          throw ArgumentError(
              'difference between start time and end time must be less than 1h');
        }
        params['endTime'] = '${endtime.millisecondsSinceEpoch}';
      }
      params['startTime'] = '${startTime.millisecondsSinceEpoch}';
    }
    final aggregatedTrades = await sendRequest(
      baseUri,
      aggregatedTradesPath,
      queryParameters: params,
    );
    if (aggregatedTrades is List) {
      return List<BinanceAggregatedTrade>.from(
        aggregatedTrades.map((t) => BinanceAggregatedTrade.fromJson(t)),
      );
    } else {
      throw const BinanceApiError(-1, 'unexpected trades format');
    }
  }

  /// Will get a specific symbol's KLines (also known as candlesticks) using `/klines` endpoint.
  /// If [limit] is provided, will modify the max number of KLines returned. (defaults to 100)
  ///
  /// API Key required : no
  ///
  /// Query weight : 1
  ///
  /// Returns a list of [BinanceKline] containing all returned data when request is a success.
  ///
  /// Throws an [ArgumentError] if endTime is before startTime (API would return empty response anyway).
  /// Throws a [BinanceApiError] if any other error occurs.
  Future<List<BinanceKline>> candlestick({
    String baseUri = defaultUri,
    required String symbol,
    required Interval interval,
    int limit = 100,
    DateTime? startTime,
    DateTime? endtime,
  }) async {
    Map<String, String> params = {
      'symbol': symbol,
      'interval': interval.value,
      'limit': '$limit',
    };
    if (startTime != null) {
      params['startTime'] = '${startTime.millisecondsSinceEpoch}';
    }
    if (endtime != null) {
      if (startTime != null && endtime.isBefore(startTime)) {
        throw ArgumentError('endTime should not be before startTime');
      }
      params['endTime'] = '${endtime.millisecondsSinceEpoch}';
    }
    final response = await sendRequest(
      baseUri,
      klinesPath,
      queryParameters: params,
    );
    if (response is List) {
      final klines = <BinanceKline>[];
      for (final kline in response) {
        if (kline is List && kline.length == 12) {
          klines.add(BinanceKline.fromJson(kline));
        } else {
          throw const BinanceApiError(-1, 'unexpected nested kline format');
        }
      }
      return klines;
    } else {
      throw const BinanceApiError(-1, 'unexpected klines format');
    }
  }

  /// Will get a specific symbol's current average price.
  ///
  /// API Key required : no
  ///
  /// Query weight : 1
  ///
  /// Returns a [BinanceAveragePrice] containing all returned data when request is a success.
  ///
  /// Throws a [BinanceApiError] if an error occurs.
  Future<BinanceAveragePrice> averagePrice({
    String baseUri = defaultUri,
    required String symbol,
  }) async =>
      BinanceAveragePrice.fromJson(await sendRequest(
        baseUri,
        avgPricePath,
        queryParameters: {'symbol': symbol},
      ));

  /// Will get statistics for the last 24 hours on a specific symbol or all.
  ///
  /// API Key required : no
  ///
  /// Query weight : 1 for a specific symbol, **40** otherwise
  ///
  /// Returns a list of [BinanceDayTicker] containing all returned data when request is a success.
  ///
  /// Throws a [BinanceApiError] if an error occurs.
  Future<List<BinanceDayTicker>> dayTicker({
    String baseUri = defaultUri,
    String? symbol,
  }) async {
    final response = await sendRequest(
      baseUri,
      dayTickerPath,
      queryParameters: symbol != null ? {'symbol': symbol} : null,
    );
    if (symbol == null) {
      // list of tickers
      if (response is List) {
        final tickers = <BinanceDayTicker>[];
        for (final ticker in response) {
          if (ticker is Map<String, dynamic>) {
            tickers.add(BinanceDayTicker.fromJson(ticker));
          } else {
            throw const BinanceApiError(-1, 'unexpected nested ticker format');
          }
        }
        return tickers;
      }
    } else {
      // one ticker
      if (response is Map) {
        if (response is Map<String, dynamic>) {
          return [BinanceDayTicker.fromJson(response)];
        }
      }
    }
    throw const BinanceApiError(-1, 'unexpected ticker format');
  }

  /// Will get ticker(s) for current price(s).
  ///
  /// API Key required : no
  ///
  /// Query weight : 1 for a specific symbol, 2 otherwise
  ///
  /// Returns a list of [BinancePriceTicker] containing all returned data when request is a success.
  ///
  /// Throws a [BinanceApiError] if an error occurs.
  Future<List<BinancePriceTicker>> priceTicker({
    String baseUri = defaultUri,
    String? symbol,
  }) async {
    final response = await sendRequest(
      baseUri,
      priceTickerPath,
      queryParameters: symbol != null ? {'symbol': symbol} : null,
    );
    if (symbol == null) {
      // list of tickers
      if (response is List) {
        final tickers = <BinancePriceTicker>[];
        for (final ticker in response) {
          if (ticker is Map<String, dynamic>) {
            tickers.add(BinancePriceTicker.fromJson(ticker));
          } else {
            throw const BinanceApiError(-1, 'unexpected nested ticker format');
          }
        }
        return tickers;
      }
    } else {
      // one ticker
      if (response is Map) {
        if (response is Map<String, dynamic>) {
          return [BinancePriceTicker.fromJson(response)];
        }
      }
    }
    throw const BinanceApiError(-1, 'unexpected ticker format');
  }

  /// Will get book ticker(s) for given symbol or all symbols.
  ///
  /// API Key required : no
  ///
  /// Query weight : 1 for a specific symbol, 2 otherwise
  ///
  /// Returns a list of [BinanceBookTicker] containing all returned data when request is a success.
  ///
  /// Throws a [BinanceApiError] if an error occurs.
  Future<List<BinanceBookTicker>> bookTicker({
    String baseUri = defaultUri,
    String? symbol,
  }) async {
    final response = await sendRequest(
      baseUri,
      bookTickerPath,
      queryParameters: symbol != null ? {'symbol': symbol} : null,
    );
    if (symbol == null) {
      // list of tickers
      if (response is List) {
        final tickers = <BinanceBookTicker>[];
        for (final ticker in response) {
          if (ticker is Map<String, dynamic>) {
            tickers.add(BinanceBookTicker.fromJson(ticker));
          } else {
            throw const BinanceApiError(-1, 'unexpected nested ticker format');
          }
        }
        return tickers;
      }
    } else {
      // one ticker
      if (response is Map) {
        if (response is Map<String, dynamic>) {
          return [BinanceBookTicker.fromJson(response)];
        }
      }
    }
    throw const BinanceApiError(-1, 'unexpected ticker format');
  }

  /// Will send a trade order to the matching engine.
  ///
  /// API Key required : yes (+ signature)
  ///
  /// Query weight : 1
  ///
  /// Returns a [BinanceTradeResponse] based on the given [OrderResponseType].
  ///
  /// Throws a [BinanceApiError] if an error occurs.
  ///
  /// If [dryRun] is true, it will send a **test** trade order to the Binance API **but will not be sent to the matching engine**.
  ///
  /// This mode shall be used to :
  ///   - validate your keys (if invalid, will throw `BinanceApiError(401, Unauthorized)`)
  ///   - check server availability (prefer using [ping] for this)
  ///   - validate the timing security (see below doc)
  ///   - validate that you are using the right set of parameters (if invalid: client throws `ArgumentError`, server may throw `BinanceApiError(400, Bad Request)`)
  ///
  /// Other info from docs :
  ///
  /// _Any `LIMIT` or `LIMIT_MAKER` type order can be made an iceberg order by sending an `icebergQty`.
  /// Any order with an `icebergQty` **MUST** have `timeInForce` set to `GTC`. (it is done by library)
  /// `MARKET` orders using `quoteOrderQty` will not break `LOT_SIZE` filter rules; the order will execute a quantity that will have the notional value as close as possible to `quoteOrderQty`. Trigger order price rules against market price for both `MARKET` and `LIMIT` versions:
  /// Price above market price: `STOP_LOSS` BUY, `TAKE_PROFIT` SELL
  /// Price below market price: `STOP_LOSS` SELL, `TAKE_PROFIT` BUY_
  ///
  /// Timing security :
  ///
  ///   A SIGNED endpoint also requires a parameter, timestamp, to be sent which should be the millisecond timestamp of when the request was created and sent.
  ///   An additional parameter, recvWindow, may be sent to specify the number of milliseconds after timestamp the request is valid for. If recvWindow is not sent, it defaults to 5000.
  ///   The logic is as follows:
  ///
  ///  ```dart
  ///   if (timestamp < (serverTime + 1000) && (serverTime - timestamp) <= recvWindow) {
  ///     // process request
  ///   } else {
  ///     // reject request
  ///   }
  ///  ```
  /// Serious trading is about timing. Networks can be unstable and unreliable, which can lead to requests taking varying amounts of time to reach the servers. With recvWindow, you can specify that the request must be processed within a certain number of milliseconds or be rejected by the server.
  ///
  /// It is recommended to use a small recvWindow of 5000 or less! The max cannot go beyond 60,000!
  Future<BinanceTradeResponse> sendOrder({
    String baseUri = defaultUri,
    required String symbol,
    Side side = Side.buy,
    OrderType type = OrderType.limit,
    TimeInForce timeInForce = TimeInForce.gtc,
    double? quantity,
    double? quoteOrderQty,
    double? price,

    /// A unique id among open orders. Automatically generated if not sent.
    /// Orders with the same newClientOrderID can be accepted only when the previous one is filled,
    /// otherwise the order will be rejected.
    String? newClientOrderId,

    /// Used with `STOP_LOSS`, `STOP_LOSS_LIMIT`, `TAKE_PROFIT`, and `TAKE_PROFIT_LIMIT` orders.
    double? stopPrice,

    /// Used with `LIMIT`, `STOP_LOSS_LIMIT`, and `TAKE_PROFIT_LIMIT to create an iceberg order.
    double? icebergQty,

    /// Set the response JSON. ACK, RESULT, or FULL; MARKET and LIMIT order types default to FULL, all other orders default to ACK.
    OrderResponseType? newOrderRespType,

    /// The value cannot be greater than 60000
    int recvWindow = 5000,
    bool dryRun = false,
  }) async {
    if (recvWindow < kMinRecvWindow || recvWindow > kMaxRecvWindow) {
      throw RangeError(
          'recvWindow should be a positive value less than $kMaxRecvWindow');
    }
    // additional mandatory parameters
    switch (type) {
      case OrderType.limit:
        if (quantity == null) throw ArgumentError.notNull('quantity');
        if (price == null) throw ArgumentError.notNull('price');
        break;
      case OrderType.market:
        // MARKET orders using the quantity field specifies the amount of the base asset the user wants to buy or sell at the market price.
        // E.g. MARKET order on BTCUSDT will specify how much BTC the user is buying or selling.
        //
        // MARKET orders using quoteOrderQty specifies the amount the user wants to spend (when buying) or receive (when selling)
        // the quote asset; the correct quantity will be determined based on the market liquidity and quoteOrderQty.
        //
        // E.g. Using the symbol BTCUSDT:
        // BUY side, the order will buy as many BTC as quoteOrderQty USDT can.
        // SELL side, the order will sell as much BTC needed to receive quoteOrderQty USDT.
        if (quantity == null) throw ArgumentError.notNull('quantity');
        if (quoteOrderQty == null) throw ArgumentError.notNull('quoteOrderQty');
        break;
      case OrderType.stopLoss:
        // This will execute a MARKET order when the stopPrice is reached.
        if (quantity == null) throw ArgumentError.notNull('quantity');
        if (stopPrice == null) throw ArgumentError.notNull('stopPrice');
        break;
      case OrderType.stopLossLimit:
        if (quantity == null) throw ArgumentError.notNull('quantity');
        if (price == null) throw ArgumentError.notNull('price');
        if (stopPrice == null) throw ArgumentError.notNull('stopPrice');
        break;
      case OrderType.takeProfit:
        // This will execute a MARKET order when the stopPrice is reached.
        if (quantity == null) throw ArgumentError.notNull('quantity');
        if (stopPrice == null) throw ArgumentError.notNull('stopPrice');
        break;
      case OrderType.takeProfitLimit:
        if (quantity == null) throw ArgumentError.notNull('quantity');
        if (price == null) throw ArgumentError.notNull('price');
        if (stopPrice == null) throw ArgumentError.notNull('stopPrice');
        break;
      case OrderType.limitMaker:
        // This is a LIMIT order that will be rejected if the order immediately matches and trades as a taker.
        // This is also known as a POST-ONLY order.
        if (quantity == null) throw ArgumentError.notNull('quantity');
        if (price == null) throw ArgumentError.notNull('price');
        break;
    }
    // build params
    final queryParameters = buildTradeOrderParams(
      symbol,
      side,
      type,
      quantity,
      recvWindow,
      timeInForce,
      quoteOrderQty,
      price,
      newClientOrderId,
      stopPrice,
      icebergQty,
      newOrderRespType,
    );
    // send request
    final result = await sendRequest(
      baseUri,
      dryRun ? testTradeOrderPath : tradeOrderPath,
      queryParameters: queryParameters,
      requestMethod: RequestMethod.post,
      withSignature: true,
    );
    if (dryRun) {
      // API response is empty Map, so here we just build an empty [BinanceTradeResponse]
      return BinanceTradeResponse.dry(symbol);
    } else {
      return BinanceTradeResponse.fromJson(result);
    }
  }

  @visibleForTesting
  Map<String, dynamic> buildTradeOrderParams(
    String symbol,
    Side side,
    OrderType type,
    double quantity,
    int recvWindow,
    TimeInForce timeInForce,
    double? quoteOrderQty,
    double? price,
    String? newClientOrderId,
    double? stopPrice,
    double? icebergQty,
    OrderResponseType? newOrderRespType,
  ) {
    final queryParameters = <String, dynamic>{
      'symbol': symbol,
      'side': side.value,
      'type': type.value,
      'quantity': '$quantity',
      'recvWindow': '$recvWindow',
      'timeInForce': timeInForce.value,
    };
    if (null != quoteOrderQty) {
      queryParameters['quoteOrderQty'] = '$quoteOrderQty';
    }
    if (null != price) {
      queryParameters['price'] = '$price';
    }
    if (null != newClientOrderId) {
      queryParameters['newClientOrderId'] = newClientOrderId;
    }
    if (null != stopPrice) {
      queryParameters['stopPrice'] = '$stopPrice';
    }
    if (null != icebergQty) {
      queryParameters['iceberQty'] = '$icebergQty';
      queryParameters['timeInForce'] = TimeInForce.gtc.value;
    }
    if (null != newOrderRespType) {
      queryParameters['newOrderRespType'] = newOrderRespType.value;
    }
    return queryParameters;
  }

  /// Will query the status of a given order.
  ///
  /// API Key required : yes (+ signature)
  ///
  /// Query weight : 2
  ///
  /// Returns a [BinanceOrderStatus] containing all returned data when request is a success.
  ///
  /// Throws a [BinanceApiError] if an error occurs.
  ///
  /// Other info from docs:
  ///
  /// - Either orderId or origClientOrderId must be sent.
  /// - For some historical orders cummulativeQuoteQty will be < 0, meaning the data is not available at this time.
  Future<dynamic> getOrderStatus({
    String baseUri = defaultUri,
    required String symbol,
    int? orderId,
    String? origClientOrderId,
    int recvWindow = 5000,
  }) {
    if (null == orderId && null == origClientOrderId) {
      throw ArgumentError('Either orderId or origClientOrderId must be sent.');
    }
    final queryParameters = {
      'symbol': symbol,
      'recvWindow': '$recvWindow',
    };
    if (null != orderId) {
      queryParameters['orderId'] = '$orderId';
    }
    if (null != origClientOrderId) {
      queryParameters['origClientOrderId'] = origClientOrderId;
    }
    return sendRequest(
      baseUri,
      tradeOrderPath,
      queryParameters: queryParameters,
      withSignature: true,
    );
  }
}
