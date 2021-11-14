import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

import 'package:dashchain/dashchain.dart';

// ignore_for_file: avoid_print
void main() {
  group('Binance REST API', () {
    // the class to be tested
    late final BinanceRestApi _api;
    // MockClients in order to tests every cases
    // classic OK/KO clients
    late final MockClient okClient =
        MockClient((Request request) => Future.value(Response(
              '{}',
              200,
              reasonPhrase: 'okClient',
            )));
    late final MockClient koClient =
        MockClient((Request request) => Future.value(Response(
              '{}',
              400,
              reasonPhrase: 'koClient',
            )));
    // clients that would send 200 only in specific case
    late final MockClient okClientApi2 = MockClient((Request request) {
      var statusCode = 200;
      if (!request.url.host.contains('api2')) statusCode = 400;
      return Future.value(Response(
        '{}',
        statusCode,
        reasonPhrase: 'okClientApi2',
      ));
    });
    late final MockClient okClientApi3 = MockClient((Request request) {
      var statusCode = 200;
      if (!request.url.host.contains('api3')) statusCode = 400;
      return Future.value(Response(
        '{}',
        statusCode,
        reasonPhrase: 'okClientApi3',
      ));
    });
    // client duplicating /time answer
    late final MockClient timeOkClient = MockClient(
      (Request request) => Future.value(
        Response(
          '{"serverTime": ${DateTime.now().millisecondsSinceEpoch}}',
          200,
          reasonPhrase: 'timeOkClient',
        ),
      ),
    );
    // client duplicating /exchangeInfo answer
    late final MockClient exchangeInfoOkClient = MockClient(
      (Request request) => Future.value(
        Response(
          jsonEncode(BinanceExchangeInfo('test', -1, [], [], []).toJson()),
          200,
          reasonPhrase: 'exchangeInfoOkClient',
        ),
      ),
    );
    // client duplicating /exchangeInfo answer
    late final MockClient orderBookOkClient = MockClient(
      (Request request) => Future.value(
        Response(
          jsonEncode(BinanceOrderBook(-1, [], []).toJson()),
          200,
          reasonPhrase: 'orderBookOkClient',
        ),
      ),
    );
    // client duplicating /trades answer
    late final MockClient tradesOkClient = MockClient(
      (Request request) => Future.value(
        Response(
          jsonEncode([
            {
              "id": 28457,
              "price": "4.00000100",
              "qty": "12.00000000",
              "quoteQty": "48.000012",
              "time": 1499865549590,
              "isBuyerMaker": true,
              "isBestMatch": true
            }
          ]),
          200,
          reasonPhrase: 'tradesOkClient',
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
      test('KO ping should throw', () async {
        _api.dispose();
        _api.apiClient = koClient;
        final ping = await _api.ping();
        expect(ping, isFalse);
      });
    });

    group('getFallbackEndpoint tests', () {
      test('should return first URI', () async {
        _api.dispose();
        _api.apiClient = okClient;
        final fallbackEndpoint = await _api.getFallbackUri();
        expect(fallbackEndpoint, equals('api1.$binanceDomain'));
      });
      test('should return second URI', () async {
        _api.dispose();
        _api.apiClient = okClientApi2;
        final fallbackEndpoint = await _api.getFallbackUri();
        expect(fallbackEndpoint, equals('api2.$binanceDomain'));
      });
      test('should return third URI', () async {
        _api.dispose();
        _api.apiClient = okClientApi3;
        final fallbackEndpoint = await _api.getFallbackUri();
        expect(fallbackEndpoint, equals('api3.$binanceDomain'));
      });
      test('should throw if no api path available', () async {
        _api.dispose();
        _api.apiClient = koClient;
        try {
          await _api.getFallbackUri();
          fail('should have thrown a BinanceApiError');
        } catch (e) {
          expect(e, isA<BinanceApiError>());
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
      test('KO time should throw', () async {
        _api.dispose();
        _api.apiClient = koClient;
        try {
          await _api.checkApiTime();
          fail('should have thrown a BinanceApiError');
        } catch (e) {
          expect(e, isA<BinanceApiError>());
        }
      });
    });
    group('exchangeInfo tests', () {
      test('OK exchangeInfo should return BinanceExchangeInfo object',
          () async {
        _api.dispose();
        _api.apiClient = exchangeInfoOkClient;
        final exchangeInfo = await _api.exchangeInfo();
        expect(exchangeInfo, isA<BinanceExchangeInfo>());
      });
      test('KO exchangeInfo should throw', () async {
        _api.dispose();
        _api.apiClient = koClient;
        try {
          await _api.exchangeInfo();
          fail('should have thrown a BinanceApiError');
        } catch (e) {
          expect(e, isA<BinanceApiError>());
        }
      });
    });
    group('orderBook tests', () {
      test('OK orderBook should return BinanceOrderBook object', () async {
        _api.dispose();
        _api.apiClient = orderBookOkClient;
        final exchangeInfo = await _api.orderBook(symbol: 'BNBETH');
        expect(exchangeInfo, isA<BinanceOrderBook>());
      });
      test('KO exchangeInfo should throw', () async {
        _api.dispose();
        _api.apiClient = koClient;
        try {
          await _api.orderBook(symbol: 'BNBETH');
          fail('should have thrown a BinanceApiError');
        } catch (e) {
          expect(e, isA<BinanceApiError>());
        }
      });
    });
    group('trades tests', () {
      test('OK trade should return BinanceTrade object', () async {
        _api.dispose();
        _api.apiClient = tradesOkClient;
        final exchangeInfo = await _api.trades(symbol: 'BNBETH');
        expect(exchangeInfo, isA<List<BinanceTrade>>());
      });
      test('KO exchangeInfo should throw', () async {
        _api.dispose();
        _api.apiClient = koClient;
        try {
          await _api.trades(symbol: 'BNBETH');
          fail('should have thrown a BinanceApiError');
        } catch (e) {
          expect(e, isA<BinanceApiError>());
        }
      });
    });
  });
}
