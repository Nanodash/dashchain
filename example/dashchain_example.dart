import 'package:dashchain/dashchain.dart';

// ignore_for_file: avoid_print
void main() async {
  // init BinanceRestApi object with API keys
  const apiKey = 'apiKey'; // EDIT HERE
  const apiSecretKey = 'apiSecretKey'; // EDIT HERE
  final binance = BinanceRestApi.withKeys(
    apiKey: apiKey,
    apiSecretKey: apiSecretKey,
  );
  try {
    // Try to get an available server
    final apiOK = await binance.ping();
    if (apiOK) {
      print('Binance REST API is up and running on $defaultUri, let\'s go !');
      await _testAPI(binance, defaultUri);
    } else {
      print('Binance REST API main cluster seems to be down, '
          'will try to get fallback cluster...');
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
  // Check for server's time and print difference with client's time
  await _checkApiTime(api, endpointUri);
  // pull the whole exchange info and look for symbols that are in the trading phase
  final tradeableSymbols = await _getTradeableSymbols(api, endpointUri);
  // try to get some trading pair
  const someCoinIHave = 'BUSD'; // EDIT HERE
  const theCoinIWant = 'BNB'; // EDIT HERE
  final maybeTargetPair =
      _maybeGetPair(someCoinIHave, theCoinIWant, tradeableSymbols);
  if (maybeTargetPair != null) {
    // if found, will send an order with minimal amount of quote asset required for the given target price
    const targetPrice = 100.0; // EDIT HERE
    await _sendLimitBuyOrder(api, endpointUri, maybeTargetPair, targetPrice);
  }
}

Future<void> _checkApiTime(
  BinanceRestApi api,
  String endpointUri,
) async {
  final time = await api.checkApiTime(baseUri: endpointUri);
  final readableTime = DateTime.fromMillisecondsSinceEpoch(time);
  final difference = DateTime.now().difference(readableTime);
  print(
      'Binance\'s server time is $time ($readableTime, diff: ${difference.inMilliseconds}ms)');
}

Future<Iterable<BinanceSymbol>> _getTradeableSymbols(
  BinanceRestApi api,
  String endpointUri,
) async {
  print('will check for exchange symbols to trade...');
  final info = await api.exchangeInfo(baseUri: endpointUri);
  final tradeableSymbols =
      info.symbols.where((s) => s.status == BinanceTradingStatus.trading.value);
  print('found ${info.symbols.length} listed symbols of which '
      '${tradeableSymbols.length} are available for trade !');
  return tradeableSymbols;
}

BinanceSymbol? _maybeGetPair(
  String someCoinIHave,
  String theCoinIWant,
  Iterable<BinanceSymbol> tradeableSymbols,
) {
  List<BinanceSymbol> symbolsICouldTrade = List<BinanceSymbol>.from(
      tradeableSymbols.where((s) => s.quoteAsset == someCoinIHave));
  if (symbolsICouldTrade.isNotEmpty) {
    print(
        'Found ${symbolsICouldTrade.length} symbol(s) with $someCoinIHave as quote asset !');
    if (symbolsICouldTrade.any((s) => s.baseAsset == theCoinIWant)) {
      print('Found some pair with $theCoinIWant as base asset !');
      return symbolsICouldTrade.firstWhere((s) => s.baseAsset == theCoinIWant);
    } else {
      print('No pair found with $theCoinIWant as base asset...');
    }
  } else {
    print('No pair found with $theCoinIWant as quote asset...');
  }
}

Future<void> _sendLimitBuyOrder(
  BinanceRestApi api,
  String endpointUri,
  BinanceSymbol targetPair,
  double targetPrice,
) async {
  // 10.0 is usually the min for quote asset quantity
  const minimumQuoteQty = 10.0;
  // Get the minimum qty to ask for with a precision of 3 digits
  var minimumQty = (minimumQuoteQty / targetPrice).toPrecision(3);
  // check that we are indeed above the min qty and adjust if needed
  if (minimumQty * targetPrice < minimumQuoteQty) {
    print(
        'adjusting qty because $minimumQty is not enough for the order to be accepted');
    do {
      minimumQty += 0.001;
    } while (minimumQty * targetPrice < minimumQuoteQty);
    print('qty is now $minimumQty');
  }
  // get current price (here only used in logs, but you can imagine to do something with the BinancePriceTicker object)
  final currentPrice = double.parse((await api.priceTicker(
    baseUri: endpointUri,
    symbol: targetPair.symbol,
  ))
      .first
      .price);
  print('sending BUY order on ${targetPair.symbol} : '
      '$minimumQty BNB at $targetPrice ${targetPair.quoteAsset} (~$minimumQuoteQty BUSD)...'
      'current price: $currentPrice ${targetPair.quoteAsset}');
  // send buy limit order
  final orderResponse = await api.sendOrder(
    baseUri: endpointUri,
    symbol: targetPair.symbol,
    quantity: minimumQty,
    price: targetPrice,
  );
  print(orderResponse);
}
