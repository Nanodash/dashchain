import 'dart:math';

import 'package:http/http.dart' as http;

import 'package:dashchain/src/binance/constants.dart';

/// Based on official docs at https://github.com/binance-exchange/binance-official-api-docs
class BinanceRestApi {
  static BinanceRestApi? _instance;

  factory BinanceRestApi() => _instance ?? BinanceRestApi._();
  BinanceRestApi._() {
    _instance = this;
    _log('API manager initialized !');
  }

  /// A simple log method (may integrate logging pkg later)
  void _log(String msg) => print('[$runtimeType] $msg');

  /// A [Stopwatch] to log requests duration (may remove before production use, or have an opt-in toggle)
  static late final Stopwatch _stopwatch = Stopwatch();

  /// Will reset [_stopwatch] and restart it
  void _restartStopwatch() {
    _stopwatch.reset();
    _stopwatch.stop();
    _stopwatch.start();
  }

  /// The default endpoint to use when interacting with Binance Rest API
  String get baseEndpoint => 'https://api.$binanceDomain$apiPath';

  /// Will return a fallback endpoint if [baseEndpoint] has some performance or availability issues
  String get fallbackEndpoint {
    final r = Random(baseEndpoint.length);
    final apiNumber = r.nextInt(3) + 1; // get number in [1, 2, 3]
    final fallbackEndpoint = 'https://api$apiNumber.$binanceDomain$apiPath';
    _log('fallback to $fallbackEndpoint');
    return fallbackEndpoint;
  }

  /// Will check for Binance's _REST API_ availability using `/ping` endpoint as recommended
  Future<bool> checkAvailability() async {
    var isApiAvailable = false;
    _restartStopwatch();
    _log('will ping API to check availability...');
    final response = await http.get(Uri.parse('$baseEndpoint/ping'));
    final code = response.statusCode;
    _log('received answer with code $code '
        'after ${_stopwatch.elapsedMilliseconds}ms.');
    switch (code) {
      case 200:
        isApiAvailable = true;
        break;
      default:
        _log('received error code ${response.statusCode}');
        _log('reasonPhrase ${response.reasonPhrase}');
        break;
    }
    return isApiAvailable;
  }
}
