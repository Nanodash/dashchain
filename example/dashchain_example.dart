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
      String? endpointUrl;
      try {
        endpointUrl = await binance.getFallbackUri();
      } catch (e) {
        print('Binance REST API is definitely down...($e)');
      }
      if (endpointUrl != null) {
        print(
            'Binance REST API is up and running on $endpointUrl, let\'s go !');
        await _testAPI(binance, endpointUrl);
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
      info.symbols.where((s) => s.status == '${BinanceTradingStatus.trading}');
  print('found ${info.symbols.length} listed symbols of which '
      '${tradeableSymbols.length} are available for trade !');
  if (tradeableSymbols.any((s) => s.quoteAsset == 'ETH')) {
    List<String> xEthSymbols = List<String>.from(tradeableSymbols
        .where((s) => s.quoteAsset == 'ETH')
        .map((s) => s.symbol));
    print('found ${xEthSymbols.length} symbols with ETH as quote asset !');
    if (xEthSymbols.isNotEmpty) {
      final firstFive = List<String>.from(xEthSymbols.take(5));
      print('will look for only first 5 symbols ($firstFive})');
      final ethExchangeInfo = await api.exchangeInfo(
        baseUri: endpointUri,
        symbols: firstFive,
      );
      print(ethExchangeInfo);
      final firstEthPair = firstFive.first;
      print('get orderbook depth for $firstEthPair');
      final orderBookDepth50 = await api.orderBook(
        symbol: firstEthPair,
        limit: 50,
      );
      print(orderBookDepth50);
      final tenLastTrades = await api.trades(
        symbol: firstEthPair,
        limit: 10,
      );
      print(tenLastTrades);
    }
  }
}
