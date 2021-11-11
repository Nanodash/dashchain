import 'package:dashchain/src/binance/binance_rest_api.dart';
import 'package:dashchain/src/binance/constants.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

// ignore_for_file: avoid_print
void main() {
  group('Binance REST API', () {
    // the class to be tested
    late final BinanceRestApi _api;
    // MockClients in order to tests every cases
    // classic OK/KO clients
    late final MockClient okClient = MockClient(
        (Request request) => Future.value(Response('okClient', 200)));
    late final MockClient koClient = MockClient(
        (Request request) => Future.value(Response('koClient', 400)));
    // clients that would send 200 only in specific case
    late final MockClient okClientApi2 = MockClient((Request request) {
      var statusCode = 200;
      if (!request.url.host.contains('api2')) statusCode = 400;
      return Future.value(Response('okClientApi2', statusCode));
    });
    late final MockClient okClientApi3 = MockClient((Request request) {
      var statusCode = 200;
      if (!request.url.host.contains('api3')) statusCode = 400;
      return Future.value(Response('okClientApi3', statusCode));
    });
    late final MockClient timeOkClient = MockClient(
      (Request request) => Future.value(
        Response(
          '{"serverTime": ${DateTime.now().millisecondsSinceEpoch}}',
          200,
        ),
      ),
    );

    setUpAll(() {
      _api = BinanceRestApi();
    });

    tearDownAll(() {
      _api.dispose();
    });

    group('/ping tests', () {
      test('OK ping should return true', () async {
        _api.dispose();
        _api.apiClient = okClient;
        final ping = await _api.ping();
        expect(ping, isTrue);
      });
      test('KO ping should return false', () async {
        _api.dispose();
        _api.apiClient = koClient;
        final ping = await _api.ping();
        expect(ping, isFalse);
      });
    });

    group('getFallbackEndpoint tests', () {
      test('should return first endpoint', () async {
        _api.dispose();
        _api.apiClient = okClient;
        final fallbackEndpoint = await _api.getfallbackEndpoint();
        expect(fallbackEndpoint, equals('https://api1.$binanceDomain$apiPath'));
      });
      test('should return second endpoint', () async {
        _api.dispose();
        _api.apiClient = okClientApi2;
        final fallbackEndpoint = await _api.getfallbackEndpoint();
        expect(fallbackEndpoint, equals('https://api2.$binanceDomain$apiPath'));
      });
      test('should return third endpoint', () async {
        _api.dispose();
        _api.apiClient = okClientApi3;
        final fallbackEndpoint = await _api.getfallbackEndpoint();
        expect(fallbackEndpoint, equals('https://api3.$binanceDomain$apiPath'));
      });
      test('should throw if no api path available', () async {
        _api.dispose();
        _api.apiClient = koClient;
        try {
          await _api.getfallbackEndpoint();
          fail('should have thrown an Exception');
        } on Exception catch (e) {
          expect(e.toString(), contains('no fallback endpoint found'));
        }
      });
    });
    group('checkApiTime tests', () {
      // used to check OK case with more than just `> 0` condition
      const int implemEpoch = 1636617336000;
      test('OK time should return an epoch time value', () async {
        _api.dispose();
        _api.apiClient = timeOkClient;
        final time = await _api.checkApiTime();
        expect(time, isPositive);
        expect(time, greaterThan(implemEpoch));
      });
      test('KO time should return -1', () async {
        _api.dispose();
        _api.apiClient = koClient;
        final time = await _api.checkApiTime();
        expect(time, isNegative);
        expect(time, equals(-1));
      });
    });
  });
}
