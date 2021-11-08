import 'dart:math';

/// Based on official docs at https://github.com/binance-exchange/binance-official-api-docs
class BinanceRestApi {
  static const String httpsScheme = 'https://';
  static const String binanceDomain = 'binance.com';

  /// The default endpoint to use when interacting with Binance Rest API
  static String get baseEndpoint => '${httpsScheme}api.$binanceDomain';

  /// Will return a fallback endpoint if [baseEndpoint] has some performance or availability issues
  static String get fallbackEndpoint {
    final r = Random(baseEndpoint.length);
    final apiNumber = r.nextInt(3) + 1; // get number in [1, 2, 3]
    return 'api$apiNumber.$binanceDomain';
  }
}
