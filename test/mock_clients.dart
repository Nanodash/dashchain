import 'dart:convert';

import 'package:dashchain/dashchain.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

// MockClients in order to tests every cases
/// simple OK client
late final MockClient okClient =
    MockClient((Request request) => Future.value(Response(
          '{}',
          200,
          reasonPhrase: 'okClient',
        )));

/// simple KO client
late final MockClient koClient =
    MockClient((Request request) => Future.value(Response(
          '{}',
          400,
          reasonPhrase: 'koClient',
        )));

/// client that would send `200` only if querying `api2`
late final MockClient okClientApi2 = MockClient((Request request) {
  var statusCode = 200;
  if (!request.url.host.contains('api2')) statusCode = 400;
  return Future.value(Response(
    '{}',
    statusCode,
    reasonPhrase: 'okClientApi2',
  ));
});

/// client that would send `200` only if querying `api3`
late final MockClient okClientApi3 = MockClient((Request request) {
  var statusCode = 200;
  if (!request.url.host.contains('api3')) statusCode = 400;
  return Future.value(Response(
    '{}',
    statusCode,
    reasonPhrase: 'okClientApi3',
  ));
});

/// client duplicating `/time` answer
late final MockClient timeOkClient = MockClient(
  (Request request) => Future.value(
    Response(
      '{"serverTime": ${DateTime.now().millisecondsSinceEpoch}}',
      200,
      reasonPhrase: 'timeOkClient',
    ),
  ),
);

/// client duplicating `/exchangeInfo` answer
late final MockClient exchangeInfoOkClient = MockClient(
  (Request request) => Future.value(
    Response(
      jsonEncode(BinanceExchangeInfo('test', -1, [], [], [])),
      200,
      reasonPhrase: 'exchangeInfoOkClient',
    ),
  ),
);

/// client duplicating `/orderBook` answer
late final MockClient orderBookOkClient = MockClient(
  (Request request) => Future.value(
    Response(
      jsonEncode(BinanceOrderBook(-1, [], [])),
      200,
      reasonPhrase: 'orderBookOkClient',
    ),
  ),
);

/// client duplicating `/trades` answer
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

/// client duplicating `/aggTrades` answer
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

/// client that returns a [Map] (used to test methods that expect a [List])
late final MockClient notAListClient = MockClient(
  (Request request) => Future.value(
    Response(
      jsonEncode({"id": 28457}),
      200,
      reasonPhrase: 'notAListClient',
    ),
  ),
);

/// client duplicating `/klines` answer
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

/// missing some fields in expected `/klines` answer (ie. length != 12)
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