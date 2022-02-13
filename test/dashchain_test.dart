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

    group('BinanceRestApi internal methods tests', () {
      test('invalid request args test', () async {
        try {
          await _api.sendRequest(defaultUri, '$apiPath/test', withKey: true);
          fail('should have thrown a BinanceApiError');
        } catch (e) {
          print(e);
          expect(e, isA<BinanceApiError>());
        }
        try {
          await _api.sendRequest(defaultUri, '$apiPath/test',
              withSignature: true);
          fail('should have thrown a BinanceApiError');
        } catch (e) {
          print(e);
          expect(e, isA<BinanceApiError>());
        }
        _api.dispose();
        _api.apiClient = okClientButNoJSON;
        try {
          await _api.sendRequest(defaultUri, '$apiPath/test');
          fail('should have thrown a BinanceApiError');
        } catch (e) {
          print(e);
          expect(e, isA<BinanceApiError>());
        }
        _api.dispose();
        _api.apiClient = okClientButError;
        try {
          await _api.sendRequest(defaultUri, '$apiPath/test');
          fail('should have thrown a BinanceApiError');
        } catch (e) {
          print(e);
          expect(e, isA<BinanceApiError>());
        }
        _api.dispose();
        _api.apiClient = koClient;
        try {
          await _api.sendRequest(defaultUri, '$apiPath/test');
          fail('should have thrown a BinanceApiError');
        } catch (e) {
          print(e);
          expect(e, isA<BinanceApiError>());
        }
      });
      test('user weight test', () {
        expect(_api.usedWeight, equals(0));
        var testResponseHeaders = <String, String>{
          'unexpectedKey': 'wont update user weight'
        };
        _api.maybeUpdateUsedWeight(testResponseHeaders);
        expect(_api.usedWeight, equals(0));
        // test increment weight
        var usedWeight = 10;
        testResponseHeaders[xMbxUsedWeightHeader] = '$usedWeight';
        _api.maybeUpdateUsedWeight(testResponseHeaders);
        expect(_api.usedWeight, equals(usedWeight));
        // test decrement weight
        usedWeight = 1;
        testResponseHeaders[xMbxUsedWeightHeader] = '$usedWeight';
        _api.maybeUpdateUsedWeight(testResponseHeaders);
        expect(_api.usedWeight, equals(usedWeight));
      });
      test('signature test', () {
        _api.apiSecretKey = 'P@ssw0rd';
        final testUri = Uri.https(defaultUri, '$apiPath/test', {
          'test': '1',
          'total': 'params',
          'isFlaky': 'false',
        });
        final totalParams = testUri.query;
        print('signature input: $totalParams');
        final signature = _api.computeSignature(testUri.query);
        final hexPattern = RegExp(r'([0-9A-z]){64}');
        expect(hexPattern.hasMatch(signature), true);
      });
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
        _api.apiKey ??= 'apiKey';
        final historicalTrades = await _api.historicalTrades(symbol: 'BNBETH');
        expect(historicalTrades, isA<List<BinanceTrade>>());
      });
      test('bad format historicalTrades should throw', () async {
        _api.dispose();
        _api.apiClient = notAListClient;
        _api.apiKey ??= 'apiKey';
        try {
          await _api.historicalTrades(symbol: 'BNBETH');
          fail('should have thrown a BinanceApiError');
        } catch (e) {
          print(e);
          expect(e, isA<BinanceApiError>());
        }
      });
      test('KO historicalTrades should throw', () async {
        _api.dispose();
        _api.apiClient = koClient;
        _api.apiKey ??= 'apiKey';
        try {
          await _api.historicalTrades(symbol: 'BNBETH');
          fail('should have thrown a BinanceApiError');
        } catch (e) {
          print(e);
          expect(e, isA<BinanceApiError>());
        }
      });
      test('no API key historicalTrades should throw', () async {
        _api.dispose();
        _api.apiClient = okClient;
        _api.apiKey = null;
        try {
          await _api.historicalTrades(symbol: 'BNBETH');
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
        final aggTrades = await _api.aggregatedTrades(
          symbol: 'BNBETH',
          startTime: midnight,
          endtime: midnightPlusHalfHour,
        );
        expect(aggTrades, isA<List<BinanceAggregatedTrade>>());
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
        try {
          await _api.averagePrice(symbol: 'BNBETH');
          fail('should have thrown a BinanceApiError');
        } catch (e) {
          print(e);
          expect(e, isA<BinanceApiError>());
        }
      });
    });
    group('dayTicker tests', () {
      test('OK dayTicker should return List object', () async {
        // select symbol, only 1 entry in the list
        _api.dispose();
        _api.apiClient = dayTickerOkClient;
        final dayTicker = await _api.dayTicker(symbol: 'BNBETH');
        expect(dayTicker, isA<List<BinanceDayTicker>>());
        expect(dayTicker.length, equals(1));
        // don't select symbol, more than 1 entry in the list
        _api.dispose();
        _api.apiClient = dayTickerOkClient2;
        final dayTickers = await _api.dayTicker();
        expect(dayTickers, isA<List<BinanceDayTicker>>());
        expect(dayTickers.length, greaterThan(1));
      });
      test('bad format dayTicker should throw', () async {
        // select symbol but list returned
        _api.dispose();
        _api.apiClient = dayTickerOkClient2;
        try {
          await _api.dayTicker(symbol: 'BNBETH');
          fail('should have thrown a BinanceApiError');
        } catch (e) {
          print(e);
          expect(e, isA<BinanceApiError>());
        }
        // no symbol selected but map returned
        _api.dispose();
        _api.apiClient = dayTickerOkClient;
        try {
          await _api.dayTicker();
          fail('should have thrown a BinanceApiError');
        } catch (e) {
          print(e);
          expect(e, isA<BinanceApiError>());
        }
      });
      test('KO dayTicker should throw', () async {
        _api.dispose();
        _api.apiClient = koClient;
        try {
          await _api.dayTicker(symbol: 'BNBETH');
          fail('should have thrown a BinanceApiError');
        } catch (e) {
          print(e);
          expect(e, isA<BinanceApiError>());
        }
      });
    });
    group('priceTicker tests', () {
      test('OK priceTicker should return List object', () async {
        // select symbol, only 1 entry in the list
        _api.dispose();
        _api.apiClient = priceTickerOkClient;
        final priceTicker = await _api.priceTicker(symbol: 'BNBETH');
        expect(priceTicker, isA<List<BinancePriceTicker>>());
        expect(priceTicker.length, equals(1));
        // don't select symbol, more than 1 entry in the list
        _api.dispose();
        _api.apiClient = priceTickerOkClient2;
        final priceTickers = await _api.priceTicker();
        expect(priceTickers, isA<List<BinancePriceTicker>>());
        expect(priceTickers.length, greaterThan(1));
      });
      test('bad format priceTicker should throw', () async {
        // select symbol but list returned
        _api.dispose();
        _api.apiClient = priceTickerOkClient2;
        try {
          await _api.priceTicker(symbol: 'BNBETH');
          fail('should have thrown a BinanceApiError');
        } catch (e) {
          print(e);
          expect(e, isA<BinanceApiError>());
        }
        // no symbol selected but map returned
        _api.dispose();
        _api.apiClient = priceTickerOkClient;
        try {
          await _api.priceTicker();
          fail('should have thrown a BinanceApiError');
        } catch (e) {
          print(e);
          expect(e, isA<BinanceApiError>());
        }
      });
      test('KO priceTicker should throw', () async {
        _api.dispose();
        _api.apiClient = koClient;
        try {
          await _api.dayTicker(symbol: 'BNBETH');
          fail('should have thrown a BinanceApiError');
        } catch (e) {
          print(e);
          expect(e, isA<BinanceApiError>());
        }
      });
    });
    group('bookTicker tests', () {
      test('OK bookTicker should return List object', () async {
        // select symbol, only 1 entry in the list
        _api.dispose();
        _api.apiClient = bookTickerOkClient;
        final bookTicker = await _api.bookTicker(symbol: 'BNBETH');
        expect(bookTicker, isA<List<BinanceBookTicker>>());
        expect(bookTicker.length, equals(1));
        // don't select symbol, more than 1 entry in the list
        _api.dispose();
        _api.apiClient = bookTickerOkClient2;
        final bookTickers = await _api.bookTicker();
        expect(bookTickers, isA<List<BinanceBookTicker>>());
        expect(bookTickers.length, greaterThan(1));
      });
      test('bad format bookTicker should throw', () async {
        // select symbol but list returned
        _api.dispose();
        _api.apiClient = bookTickerOkClient2;
        try {
          await _api.bookTicker(symbol: 'BNBETH');
          fail('should have thrown a BinanceApiError');
        } catch (e) {
          print(e);
          expect(e, isA<BinanceApiError>());
        }
        // no symbol selected but map returned
        _api.dispose();
        _api.apiClient = bookTickerOkClient;
        try {
          await _api.bookTicker();
          fail('should have thrown a BinanceApiError');
        } catch (e) {
          print(e);
          expect(e, isA<BinanceApiError>());
        }
      });
      test('KO bookTicker should throw', () async {
        _api.dispose();
        _api.apiClient = koClient;
        try {
          await _api.bookTicker(symbol: 'BNBETH');
          fail('should have thrown a BinanceApiError');
        } catch (e) {
          print(e);
          expect(e, isA<BinanceApiError>());
        }
      });
    });
  });
}
