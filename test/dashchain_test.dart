import 'package:test/test.dart';

import 'package:dashchain/dashchain.dart';

import 'mock_clients.dart';

// ignore_for_file: avoid_print
void main() {
  group('Binance REST API', () {
    // the class to be tested
    late final BinanceRestApi _api;

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
      test('klines with endtime before start time should throw', () async {
        _api.dispose();
        _api.apiClient = klinesOkClient;
        final now = DateTime.now();
        final start = now;
        final end = now.subtract(const Duration(milliseconds: 1));
        expect(end.isBefore(start), isTrue);
        try {
          await _api.candlestick(
            symbol: 'BNBETH',
            interval: Interval.d1,
            startTime: start,
            endtime: end,
          );
          fail('should have thrown an ArgumentError');
        } catch (e) {
          print(e);
          expect(e, isA<ArgumentError>());
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

    group('/avgPrice tests', () {
      test('OK avgPrice should return a BinanceAveragePrice', () async {
        _api.dispose();
        _api.apiClient = avgPriceOkClient;
        final avgPrice = await _api.averagePrice(symbol: 'BNBETH');
        expect(avgPrice, isA<BinanceAveragePrice>());
      });
      test('KO avgPrice should throw', () async {
        _api.dispose();
        _api.apiClient = koClient;
        final ping = await _api.ping();
        expect(ping, isFalse);
      });
    });
  });
}
