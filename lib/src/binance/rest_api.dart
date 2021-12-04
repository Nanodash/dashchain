import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:dashchain/dashchain.dart';

/// Based on official docs at https://github.com/binance-exchange/binance-official-api-docs
class BinanceRestApi {
  static BinanceRestApi? _instance;

  factory BinanceRestApi() => _instance ?? BinanceRestApi._();
  BinanceRestApi._() {
    _apiClient = http.Client();
    _instance = this;
    _log('API manager initialized !');
  }

  /// Will dispose any resources used by this class
  void dispose() => _apiClient.close();

  /// The HTTP Client  used to make requests
  late http.Client _apiClient;

  /// Exposing setter for mocking capabilities in unit tests
  set apiClient(http.Client client) => _apiClient = client;

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
  Future<dynamic> _sendRequest(
    String baseUri,
    String resourcePath, {
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    final uri = Uri.https(
      baseUri,
      '$apiPath$resourcePath',
      queryParameters,
    );
    _log('GET $uri');
    _restartStopwatch();
    final response = await _apiClient.get(uri, headers: headers);
    _log('received answer after ${_stopwatch.elapsedMilliseconds}ms.');
    switch (response.statusCode) {
      case 200:
        _maybeUpdateUsedWeight(response.headers);
        try {
          return jsonDecode(response.body);
        } on FormatException catch (e) {
          final error = BinanceApiError(-1, e);
          _log('caught error during request...$error');
          throw error;
        }
      default:
        final error =
            BinanceApiError(response.statusCode, response.reasonPhrase);
        _log('caught error during request...$error');
        throw error;
    }
  }

  /// Will check response's headers to update the current requests quota.
  void _maybeUpdateUsedWeight(Map<String, String> headers) {
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
      await _sendRequest(baseUri, pingPath);
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
      (await _sendRequest(baseUri, timePath))['serverTime'];

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
      BinanceExchangeInfo.fromJson(await _sendRequest(
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
      BinanceOrderBook.fromJson(await _sendRequest(
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
    final trades = await _sendRequest(
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
    required String apiKey,
    int limit = 100,
    int? fromId,
  }) async {
    Map<String, String> params = {'symbol': symbol, 'limit': '$limit'};
    if (fromId != null) {
      params['fromId'] = '$fromId';
    }
    final historicalTrades = await _sendRequest(
      baseUri,
      historicalTradesPath,
      headers: {xMbxApiKeyHeader: apiKey},
      queryParameters: params,
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
    final aggregatedTrades = await _sendRequest(
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
  /// Throws a [BinanceApiError] if any error occurs.
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
      params['endTime'] = '${endtime.millisecondsSinceEpoch}';
    }
    final response = await _sendRequest(
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
}
