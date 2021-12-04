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
          jsonEncode(BinanceExchangeInfo('test', -1, [], [], [])),
          200,
          reasonPhrase: 'exchangeInfoOkClient',
        ),
      ),
    );
    // client duplicating /exchangeInfo answer
    late final MockClient orderBookOkClient = MockClient(
      (Request request) => Future.value(
        Response(
          jsonEncode(BinanceOrderBook(-1, [], [])),
          200,
          reasonPhrase: 'orderBookOkClient',
        ),
      ),
    );
    // clients duplicating /trades answer
    late final MockClient tradesOkClient = MockClient(
      (Request request) => Future.value(
        Response(
          jsonEncode([
            BinanceTrade(
              28457,
              '4.00000100',
              '12.00000000',
              '48.000012',
              1499865549590,
              true,
              true,
            )
          ]),
          200,
          reasonPhrase: 'tradesOkClient',
        ),
      ),
    );
    // clients duplicating /aggTrades answer
    late final MockClient aggTradesOkClient = MockClient(
      (Request request) => Future.value(
        Response(
          jsonEncode([
            BinanceAggregatedTrade(
              26129,
              '0.01633102',
              '4.70443515',
              27781,
              27781,
              1498793709153,
              true,
              true,
            )
          ]),
          200,
          reasonPhrase: 'aggTradesOkClient',
        ),
      ),
    );
    late final MockClient notAListClient = MockClient(
      (Request request) => Future.value(
        Response(
          jsonEncode({"id": 28457}),
          200,
          reasonPhrase: 'notAListClient',
        ),
      ),
    );
    late final MockClient klinesOkClient = MockClient(
      (Request request) => Future.value(
        Response(
          jsonEncode([
            [
              1499040000000, // Open time
              "0.01634790", // Open
              "0.80000000", // High
              "0.01575800", // Low
              "0.01577100", // Close
              "148976.11427815", // Volume
              1499644799999, // Close time
              "2434.19055334", // Quote asset volume
              308, // Number of trades
              "1756.87402397", // Taker buy base asset volume
              "28.46694368", // Taker buy quote asset volume
              "17928899.62484339" // Ignore.
            ]
          ]),
          200,
          reasonPhrase: 'klinesOkClient',
        ),
      ),
    );
    // missing some fields (ie. length != 12)
    late final MockClient klinesKoClient = MockClient(
      (Request request) => Future.value(
        Response(
          jsonEncode([
            [
              1499040000000, // Open time
              "0.01634790", // Open
              "0.01575800", // Low
              "148976.11427815", // Volume
              1499644799999, // Close time
              "2434.19055334", // Quote asset volume
              "28.46694368", // Taker buy quote asset volume
            ]
          ]),
          200,
          reasonPhrase: 'klinesKoClient',
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
          print(e);
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
          print(e);
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
          print(e);
          expect(e, isA<BinanceApiError>());
        }
      });
    });
    group('orderBook tests', () {
      test('OK orderBook should return BinanceOrderBook object', () async {
        _api.dispose();
        _api.apiClient = orderBookOkClient;
        final orderBook = await _api.orderBook(symbol: 'BNBETH');
        expect(orderBook, isA<BinanceOrderBook>());
      });
      test('KO orderBook should throw', () async {
        _api.dispose();
        _api.apiClient = koClient;
        try {
          await _api.orderBook(symbol: 'BNBETH');
          fail('should have thrown a BinanceApiError');
        } catch (e) {
          print(e);
          expect(e, isA<BinanceApiError>());
        }
      });
    });
    group('trades tests', () {
      test('OK trades should return BinanceTrade object', () async {
        _api.dispose();
        _api.apiClient = tradesOkClient;
        final trades = await _api.trades(symbol: 'BNBETH');
        expect(trades, isA<List<BinanceTrade>>());
      });
      test('bad format trades should throw', () async {
        _api.dispose();
        _api.apiClient = notAListClient;
        try {
          await _api.trades(symbol: 'BNBETH');
          fail('should have thrown a BinanceApiError');
        } catch (e) {
          print(e);
          expect(e, isA<BinanceApiError>());
        }
      });
      test('KO trades should throw', () async {
        _api.dispose();
        _api.apiClient = koClient;
        try {
          await _api.trades(symbol: 'BNBETH');
          fail('should have thrown a BinanceApiError');
        } catch (e) {
          print(e);
          expect(e, isA<BinanceApiError>());
        }
      });
    });
    group('historicalTrades tests', () {
      test('OK historicalTrades should return BinanceTrade object', () async {
        _api.dispose();
        _api.apiClient = tradesOkClient;
        final historicalTrades =
            await _api.historicalTrades(symbol: 'BNBETH', apiKey: 'apiKey');
        expect(historicalTrades, isA<List<BinanceTrade>>());
      });
      test('bad format historicalTrades should throw', () async {
        _api.dispose();
        _api.apiClient = notAListClient;
        try {
          await _api.historicalTrades(symbol: 'BNBETH', apiKey: 'apiKey');
          fail('should have thrown a BinanceApiError');
        } catch (e) {
          print(e);
          expect(e, isA<BinanceApiError>());
        }
      });
      test('KO historicalTrades should throw', () async {
        _api.dispose();
        _api.apiClient = koClient;
        try {
          await _api.historicalTrades(symbol: 'BNBETH', apiKey: 'apiKey');
          fail('should have thrown a BinanceApiError');
        } catch (e) {
          print(e);
          expect(e, isA<BinanceApiError>());
        }
      });
    });
    group('aggTrades tests', () {
      test('OK aggTrades should return Map object', () async {
        _api.dispose();
        _api.apiClient = aggTradesOkClient;
        final aggTrades = await _api.aggregatedTrades(symbol: 'BNBETH');
        expect(aggTrades, isA<List<BinanceAggregatedTrade>>());
      });
      test(
          'aggTrades with less than 1h between start and end time should throw',
          () async {
        _api.dispose();
        _api.apiClient = aggTradesOkClient;
        final midnight = DateTime(2021, 11, 21, 0);
        final midnightPlusHalfHour = DateTime(2021, 11, 21, 0, 30);
        final midnightPlusHour = DateTime(2021, 11, 21, 1);
        try {
          await _api.aggregatedTrades(
            symbol: 'BNBETH',
            startTime: midnight,
            endtime: midnightPlusHour,
          );
          fail('should have thrown an ArgumentError');
        } catch (e) {
          print(e);
          expect(e, isA<ArgumentError>());
        }
        try {
          final aggTrades = await _api.aggregatedTrades(
            symbol: 'BNBETH',
            startTime: midnight,
            endtime: midnightPlusHalfHour,
          );
          expect(aggTrades, isA<List<BinanceAggregatedTrade>>());
        } catch (e) {
          print(e);
          fail('should not have thrown an Exception');
        }
      });
      test('bad format aggTrades should throw', () async {
        _api.dispose();
        _api.apiClient = notAListClient;
        try {
          await _api.aggregatedTrades(symbol: 'BNBETH');
          fail('should have thrown a BinanceApiError');
        } catch (e) {
          print(e);
          expect(e, isA<BinanceApiError>());
        }
      });
      test('KO aggTrades should throw', () async {
        _api.dispose();
        _api.apiClient = koClient;
        try {
          await _api.aggregatedTrades(symbol: 'BNBETH');
          fail('should have thrown a BinanceApiError');
        } catch (e) {
          print(e);
          expect(e, isA<BinanceApiError>());
        }
      });
    });
    group('klines tests', () {
      test('OK klines should return List object', () async {
        _api.dispose();
        _api.apiClient = klinesOkClient;
        final klines =
            await _api.candlestick(symbol: 'BNBETH', interval: Interval.d1);
        expect(klines, isA<List<BinanceKline>>());
      });
      test('bad format klines should throw', () async {
        _api.dispose();
        _api.apiClient = notAListClient;
        try {
          await _api.candlestick(symbol: 'BNBETH', interval: Interval.d1);
          fail('should have thrown a BinanceApiError');
        } catch (e) {
          print(e);
          expect(e, isA<BinanceApiError>());
        }
        _api.dispose();
        _api.apiClient = klinesKoClient;
        try {
          await _api.candlestick(symbol: 'BNBETH', interval: Interval.d1);
          fail('should have thrown a BinanceApiError');
        } catch (e) {
          print(e);
          expect(e, isA<BinanceApiError>());
        }
      });
      test('KO klines should throw', () async {
        _api.dispose();
        _api.apiClient = koClient;
        try {
          await _api.candlestick(symbol: 'BNBETH', interval: Interval.d1);
          fail('should have thrown a BinanceApiError');
        } catch (e) {
          print(e);
          expect(e, isA<BinanceApiError>());
        }
      });
    });
  });
}
