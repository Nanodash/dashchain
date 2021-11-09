import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:math';

/// Based on official docs at https://github.com/binance-exchange/binance-official-api-docs
class BinanceRestApi {
  static BinanceRestApi? _instance;

  factory BinanceRestApi() => _instance ?? BinanceRestApi._();
  BinanceRestApi._();

  static late final Stopwatch _stopwatch = Stopwatch();

  static const String httpsScheme = 'https://';
  static const String binanceDomain = 'binance.com';
  static const String apiPath = '/api/v3';

  /// The default endpoint to use when interacting with Binance Rest API
  static String get baseEndpoint => '${httpsScheme}api.$binanceDomain$apiPath';

  /// Will return a fallback endpoint if [baseEndpoint] has some performance or availability issues
  static String get fallbackEndpoint {
    final r = Random(baseEndpoint.length);
    final apiNumber = r.nextInt(3) + 1; // get number in [1, 2, 3]
    return '${httpsScheme}api$apiNumber.$binanceDomain$apiPath';
  }

  Future<bool> checkAvailability() async {
    var isApiAvailable = false;
    _stopwatch.reset();
    _stopwatch.start();
    print('will ping API to check availability...');
    final response = await http.get(Uri.parse('$baseEndpoint/ping'));
    final code = response.statusCode;
    print(
        'received answer with code $code after ${_stopwatch.elapsedMilliseconds}ms.');
    switch (code) {
      case 200:
        isApiAvailable = true;
        break;
      default:
        print('received error code ${response.statusCode}');
        print('reasonPhrase ${response.reasonPhrase}');
        break;
    }
    return isApiAvailable;
  }
}
