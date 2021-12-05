import 'package:dashchain/dashchain.dart';

// ignore_for_file: avoid_print
void main() async {
  final binance = BinanceRestApi();
  try {
    final apiOK = await binance.ping();
    if (apiOK) {
      print('Binance REST API is up and running on $defaultUri, let\'s go !');
      await _testAPI(binance, defaultUri);
    } else {
      print('Binance REST API seems to be down, will try to fallback...');
      String? endpointUri;
      try {
        endpointUri = await binance.getFallbackUri();
      } catch (e) {
        print('Binance REST API is definitely down...($e)');
      }
      if (endpointUri != null) {
        print(
            'Binance REST API is up and running on $endpointUri, let\'s go !');
        await _testAPI(binance, endpointUri);
      }
    }
  } catch (e) {
    print('got error during script execution...($e)');
  }
  binance.dispose();
}

Future<void> _testAPI(BinanceRestApi api, String endpointUri) async {
  final time = await api.checkApiTime(baseUri: endpointUri);
  final readableTime = DateTime.fromMillisecondsSinceEpoch(time);
  print('Binance\'s server time is $time ($readableTime)');
  print('will check for exchange symbols to trade...');
  final info = await api.exchangeInfo(baseUri: endpointUri);
  final tradeableSymbols =
      info.symbols.where((s) => s.status == BinanceTradingStatus.trading.value);
  print('found ${info.symbols.length} listed symbols of which '
      '${tradeableSymbols.length} are available for trade !');
  if (tradeableSymbols.any((s) => s.quoteAsset == 'ETH')) {
    List<BinanceSymbol> xEthSymbols = List<BinanceSymbol>.from(
        tradeableSymbols.where((s) => s.quoteAsset == 'ETH'));
    print('found ${xEthSymbols.length} symbols with ETH as quote asset !');
    if (xEthSymbols.isNotEmpty) {
      final firstFive =
          List<String>.from(xEthSymbols.map((s) => s.symbol).take(5));
      print('will look for only first 5 symbols ($firstFive})');
      final ethExchangeInfo = await api.exchangeInfo(
        baseUri: endpointUri,
        symbols: firstFive,
      );
      print(ethExchangeInfo);
      if (xEthSymbols.any((s) => s.baseAsset == 'BNB')) {
        final bnbEthPair =
            xEthSymbols.firstWhere((s) => s.baseAsset == 'BNB').symbol;
        print('get orderbook depth for $bnbEthPair');
        final orderBookDepth50 = await api.orderBook(
          baseUri: endpointUri,
          symbol: bnbEthPair,
          limit: 50,
        );
        print(orderBookDepth50);
        final tenLastTrades = await api.trades(
          baseUri: endpointUri,
          symbol: bnbEthPair,
          limit: 10,
        );
        print(tenLastTrades);
        final lastId = tenLastTrades.last.id;
        print(lastId);
        final historicalTrade = await api.historicalTrades(
          baseUri: endpointUri,
          symbol: bnbEthPair,
          apiKey: _apiKey,
          fromId: lastId,
        );
        print(historicalTrade);
        final aggTrades = await api.aggregatedTrades(
          baseUri: endpointUri,
          symbol: bnbEthPair,
          startTime:
              DateTime.now().subtract(const Duration(hours: 1, minutes: 45)),
          endtime: DateTime.now().subtract(const Duration(hours: 1)),
        );
        print(aggTrades);
        final klines = await api.candlestick(
          symbol: bnbEthPair,
          interval: Interval.d1,
          limit: 10,
        );
        print(klines);
      }
    }
  }
}
