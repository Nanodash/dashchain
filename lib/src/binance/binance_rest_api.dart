import 'dart:convert';

import 'package:dashchain/src/binance/binance_models/binance_models.dart';
import 'package:http/http.dart' as http;

import 'package:dashchain/src/binance/binance_constants.dart';

/// Based on official docs at https://github.com/binance-exchange/binance-official-api-docs
class BinanceRestApi {
  static BinanceRestApi? _instance;

  factory BinanceRestApi() => _instance ?? BinanceRestApi._();
  BinanceRestApi._() {
    _apiClient = http.Client();
    _instance = this;
    _log('API manager initialized !');
  }

  /// The HTTP Client  used to make requests
  late http.Client _apiClient;

  /// Exposing setter for mocking capabilities in unit tests
  set apiClient(http.Client client) => _apiClient = client;

  /// Will dispose any resources used by this class
  void dispose() => _apiClient.close();

  /// A simple log method (may integrate logging pkg later)
  void _log(String msg) => print('[$runtimeType] $msg');

  /// A [Stopwatch] to log requests duration (may remove before production use, or have an opt-in toggle)
  static late final Stopwatch _stopwatch = Stopwatch();

  /// Will reset [_stopwatch] and restart it
  void _restartStopwatch() {
    _stopwatch.stop();
    _stopwatch.reset();
    _stopwatch.start();
  }

  /// Will return a fallback endpoint if [baseEndpoint] has some performance or availability issues.
  ///
  /// As per Binance's docs, there are 3 more clusters for API calls with names `api1`, `api2` and `api3`.
  Future<String> getfallbackEndpoint() async {
    _log('will try to find a fallback endpoint');
    String? fallbackEndpoint;
    for (var i = 1; i < 4; i++) {
      final candidateEndpoint = 'https://api$i.$binanceDomain$apiPath';
      final ping = await _ping(candidateEndpoint);
      if (ping) {
        _log('found a fallback endpoint at $candidateEndpoint');
        fallbackEndpoint = candidateEndpoint;
        break;
      }
    }
    if (fallbackEndpoint != null) {
      return fallbackEndpoint;
    } else {
      // TODO implement custom exceptions
      throw Exception('no fallback endpoint found');
    }
  }

  /// Will check for Binance's _REST API_ availability using `/ping` endpoint as recommended
  ///
  /// Returns :
  /// - `true` when request is a success
  /// - `false` otherwise
  Future<bool> ping() async => _ping(baseEndpoint);
  Future<bool> _ping(String uri) async {
    bool isApiAvailable = false;
    _log('will ping API to check availability...');
    _restartStopwatch();
    final response = await _apiClient.get(Uri.parse('$uri$pingPath'));
    _log('received answer after ${_stopwatch.elapsedMilliseconds}ms.');
    _log('statusCode ${response.statusCode}');
    _log('reasonPhrase ${response.reasonPhrase}');
    if (response.statusCode == 200) {
      isApiAvailable = true;
    }
    return isApiAvailable;
  }

  /// Will check for Binance's _REST API_ server time using `/time` endpoint.
  ///
  /// Returns :
  /// -  _Epoch time_ in milliseconds when request is a success
  /// - `-1` otherwise
  Future<int> checkApiTime({String uri = baseEndpoint}) async {
    int serverTime = -1;
    _log('will check API server time...');
    _restartStopwatch();
    final response = await _apiClient.get(Uri.parse('$uri$timePath'));
    _log('received answer after ${_stopwatch.elapsedMilliseconds}ms.');
    _log('statusCode ${response.statusCode}');
    _log('reasonPhrase ${response.reasonPhrase}');
    if (response.statusCode == 200) {
      final body = response.body;
      serverTime = jsonDecode(body)['serverTime'];
    }
    return serverTime;
  }

  Future<ExchangeInfo?> exchangeInfo({String uri = baseEndpoint}) async {
    _restartStopwatch();
    final response = await _apiClient.get(Uri.parse('$uri$exchangeInfoPath'));
    _log('received answer after ${_stopwatch.elapsedMilliseconds}ms.');
    _log('statusCode ${response.statusCode}');
    _log('reasonPhrase ${response.reasonPhrase}');
    if (response.statusCode == 200) {
      final body = response.body;
      return ExchangeInfo.fromJson(jsonDecode(body));
    } else {
      return null;
    }
  }
}
