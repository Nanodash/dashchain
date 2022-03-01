import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/testing.dart';

import 'package:dashchain/dashchain.dart';

// MockClients in order to tests every cases
/// simple OK client
late final MockClient okClient =
    MockClient((Request request) => Future.value(Response(
          '{}',
          200,
          reasonPhrase: 'okClient',
        )));

/// simple OK client but with wrong JSON
late final MockClient okClientButNoJSON =
    MockClient((Request request) => Future.value(Response(
          'i am not a JSON String',
          200,
          reasonPhrase: 'okClientButNoJSON',
        )));

/// simple OK client but with an error response is answered
late final MockClient okClientButError =
    MockClient((Request request) => Future.value(Response(
          jsonEncode({"code": -1000, "msg": "testing err response."}),
          200,
          reasonPhrase: 'okClientButError',
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
      jsonEncode(BinanceExchangeInfo('test', -1, [
        BinanceRateLimiter.fromJson({
          'rateLimitType': 'test',
          'interval': Interval.d1.value,
          'intervalNum': -1,
          'limit': -1,
        }),
      ], [
        BinanceExchangeFilter.fromJson({
          'filterType': 'test',
          'maxNumAlgoOrders': -1,
        }),
      ], [
        BinanceSymbol(
          'test',
          BinanceTradingStatus
              .auctionMatch.value, // last enum value for coverage
          'test',
          6,
          'test',
          6,
          6,
          6,
          6,
          [],
          false,
          false,
          false,
          false,
          false,
          [],
          [],
        ),
      ])),
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

/// client duplicating `/avgPrice` answer
late final MockClient avgPriceOkClient = MockClient(
  (Request request) => Future.value(
    Response(
      jsonEncode({"mins": 5, "price": "9.35751834"}),
      200,
      reasonPhrase: 'avgPriceOkClient',
    ),
  ),
);

late final MockClient dayTickerOkClient = MockClient(
  (Request request) => Future.value(
    Response(
      jsonEncode(
        {
          "symbol": "BNBBTC",
          "priceChange": "-94.99999800",
          "priceChangePercent": "-95.960",
          "weightedAvgPrice": "0.29628482",
          "prevClosePrice": "0.10002000",
          "lastPrice": "4.00000200",
          "lastQty": "200.00000000",
          "bidPrice": "4.00000000",
          "bidQty": "100.00000000",
          "askPrice": "4.00000200",
          "askQty": "100.00000000",
          "openPrice": "99.00000000",
          "highPrice": "100.00000000",
          "lowPrice": "0.10000000",
          "volume": "8913.30000000",
          "quoteVolume": "15.30000000",
          "openTime": 1499783499040,
          "closeTime": 1499869899040,
          "firstId": 28385, // First tradeId
          "lastId": 28460, // Last tradeId
          "count": 76 // Trade count
        },
      ),
      200,
      reasonPhrase: 'dayTickerOkClient',
    ),
  ),
);
late final MockClient dayTickerOkClient2 = MockClient(
  (Request request) => Future.value(
    Response(
      jsonEncode(
        [
          {
            "symbol": "BNBBTC",
            "priceChange": "-94.99999800",
            "priceChangePercent": "-95.960",
            "weightedAvgPrice": "0.29628482",
            "prevClosePrice": "0.10002000",
            "lastPrice": "4.00000200",
            "lastQty": "200.00000000",
            "bidPrice": "4.00000000",
            "bidQty": "100.00000000",
            "askPrice": "4.00000200",
            "askQty": "100.00000000",
            "openPrice": "99.00000000",
            "highPrice": "100.00000000",
            "lowPrice": "0.10000000",
            "volume": "8913.30000000",
            "quoteVolume": "15.30000000",
            "openTime": 1499783499040,
            "closeTime": 1499869899040,
            "firstId": 28385, // First tradeId
            "lastId": 28460, // Last tradeId
            "count": 76 // Trade count
          },
          {
            "symbol": "BNBBTC",
            "priceChange": "-94.99999800",
            "priceChangePercent": "-95.960",
            "weightedAvgPrice": "0.29628482",
            "prevClosePrice": "0.10002000",
            "lastPrice": "4.00000200",
            "lastQty": "200.00000000",
            "bidPrice": "4.00000000",
            "bidQty": "100.00000000",
            "askPrice": "4.00000200",
            "askQty": "100.00000000",
            "openPrice": "99.00000000",
            "highPrice": "100.00000000",
            "lowPrice": "0.10000000",
            "volume": "8913.30000000",
            "quoteVolume": "15.30000000",
            "openTime": 1499783499040,
            "closeTime": 1499869899040,
            "firstId": 28385, // First tradeId
            "lastId": 28460, // Last tradeId
            "count": 76 // Trade count
          },
          {
            "symbol": "BNBBTC",
            "priceChange": "-94.99999800",
            "priceChangePercent": "-95.960",
            "weightedAvgPrice": "0.29628482",
            "prevClosePrice": "0.10002000",
            "lastPrice": "4.00000200",
            "lastQty": "200.00000000",
            "bidPrice": "4.00000000",
            "bidQty": "100.00000000",
            "askPrice": "4.00000200",
            "askQty": "100.00000000",
            "openPrice": "99.00000000",
            "highPrice": "100.00000000",
            "lowPrice": "0.10000000",
            "volume": "8913.30000000",
            "quoteVolume": "15.30000000",
            "openTime": 1499783499040,
            "closeTime": 1499869899040,
            "firstId": 28385, // First tradeId
            "lastId": 28460, // Last tradeId
            "count": 76 // Trade count
          },
        ],
      ),
      200,
      reasonPhrase: 'dayTickerOkClient2',
    ),
  ),
);

late final MockClient priceTickerOkClient = MockClient(
  (Request request) => Future.value(
    Response(
      jsonEncode({"symbol": "BNBBTC", "price": "4.00000200"}),
      200,
      reasonPhrase: 'priceTickerOkClient',
    ),
  ),
);
late final MockClient priceTickerOkClient2 = MockClient(
  (Request request) => Future.value(
    Response(
      jsonEncode(
        [
          {"symbol": "BNBBTC", "price": "4.00000200"},
          {"symbol": "BNBBTC", "price": "4.00000200"},
          {"symbol": "BNBBTC", "price": "4.00000200"},
        ],
      ),
      200,
      reasonPhrase: 'priceTickerOkClient2',
    ),
  ),
);

late final MockClient bookTickerOkClient = MockClient(
  (Request request) => Future.value(
    Response(
      jsonEncode({
        "symbol": "LTCBTC",
        "bidPrice": "4.00000000",
        "bidQty": "431.00000000",
        "askPrice": "4.00000200",
        "askQty": "9.00000000"
      }),
      200,
      reasonPhrase: 'bookTickerOkClient',
    ),
  ),
);
late final MockClient bookTickerOkClient2 = MockClient(
  (Request request) => Future.value(
    Response(
      jsonEncode(
        [
          {
            "symbol": "LTCBTC",
            "bidPrice": "4.00000000",
            "bidQty": "431.00000000",
            "askPrice": "4.00000200",
            "askQty": "9.00000000"
          },
          {
            "symbol": "ETHBTC",
            "bidPrice": "0.07946700",
            "bidQty": "9.00000000",
            "askPrice": "100000.00000000",
            "askQty": "1000.00000000"
          }
        ],
      ),
      200,
      reasonPhrase: 'bookTickerOkClient2',
    ),
  ),
);

late final MockClient tradeOrderOkClient = MockClient(
  (Request request) {
    Response mockResponse;
    Map<String, dynamic> mockResponseData;
    String orderResponseTypeString =
        request.url.queryParameters['newOrderRespType']!;
    OrderResponseType? orderResponseType;
    if (orderResponseTypeString == OrderResponseType.ack.value) {
      orderResponseType = OrderResponseType.ack;
    } else if (orderResponseTypeString == OrderResponseType.result.value) {
      orderResponseType = OrderResponseType.result;
    } else if (orderResponseTypeString == OrderResponseType.full.value) {
      orderResponseType = OrderResponseType.full;
    }
    if (orderResponseType != null) {
      switch (orderResponseType) {
        case OrderResponseType.ack:
          mockResponseData = {
            "symbol": "BTCUSDT",
            "orderId": 28,
            "orderListId": -1, //Unless OCO, value will be -1
            "clientOrderId": "6gCrw2kRUAF9CvJDGP16IP",
            "transactTime": 1507725176595
          };
          mockResponse = Response(
            jsonEncode(mockResponseData),
            200,
            reasonPhrase: 'ackTradeOrderOkClient',
          );
          break;
        case OrderResponseType.result:
          mockResponseData = {
            "symbol": "BTCUSDT",
            "orderId": 28,
            "orderListId": -1, //Unless OCO, value will be -1
            "clientOrderId": "6gCrw2kRUAF9CvJDGP16IP",
            "transactTime": 1507725176595,
            "price": "0.00000000",
            "origQty": "10.00000000",
            "executedQty": "10.00000000",
            "cummulativeQuoteQty": "10.00000000",
            "status": "FILLED",
            "timeInForce": "GTC",
            "type": "MARKET",
            "side": "SELL"
          };
          mockResponse = Response(
            jsonEncode(mockResponseData),
            200,
            reasonPhrase: 'resultTradeOrderOkClient',
          );
          break;
        case OrderResponseType.full:
          mockResponseData = {
            "symbol": "BTCUSDT",
            "orderId": 28,
            "orderListId": -1, //Unless OCO, value will be -1
            "clientOrderId": "6gCrw2kRUAF9CvJDGP16IP",
            "transactTime": 1507725176595,
            "price": "0.00000000",
            "origQty": "10.00000000",
            "executedQty": "10.00000000",
            "cummulativeQuoteQty": "10.00000000",
            "status": "FILLED",
            "timeInForce": "GTC",
            "type": "MARKET",
            "side": "SELL",
            "fills": [
              BinanceOrderFill(
                "4000.00000000",
                "1.00000000",
                "4.00000000",
                "USDT",
                56,
              ).toJson(),
              BinanceOrderFill(
                "3999.00000000",
                "5.00000000",
                "19.99500000",
                "USDT",
                57,
              ).toJson(),
              BinanceOrderFill(
                "3998.00000000",
                "2.00000000",
                "7.99600000",
                "USDT",
                58,
              ).toJson(),
              BinanceOrderFill(
                "3997.00000000",
                "1.00000000",
                "3.99700000",
                "USDT",
                59,
              ).toJson(),
              BinanceOrderFill(
                "3995.00000000",
                "1.00000000",
                "3.99500000",
                "USDT",
                60,
              ).toJson()
            ]
          };
          mockResponse = Response(
            jsonEncode(mockResponseData),
            200,
            reasonPhrase: 'fullTradeOrderOkClient',
          );
          break;
      }
    } else {
      mockResponseData = {};
      mockResponse = Response(
        jsonEncode(mockResponseData),
        400,
        reasonPhrase: 'unknown order response type string',
      );
    }
    return Future.value(mockResponse);
  },
);

late final MockClient testTradeOrderOkClient = MockClient(
  (Request request) => Future.value(Response(
    jsonEncode({}),
    200,
    reasonPhrase: 'testTradeOrderOkClient',
  )),
);

late final MockClient getTradeOrderOkClient = MockClient(
  (Request request) => Future.value(Response(
    jsonEncode({
      "symbol": "LTCBTC",
      "orderId": 1,
      "orderListId": -1, //Unless part of an OCO, the value will always be -1.
      "clientOrderId": "myOrder1",
      "price": "0.1",
      "origQty": "1.0",
      "executedQty": "0.0",
      "cummulativeQuoteQty": "0.0",
      "status": "NEW",
      "timeInForce": "GTC",
      "type": "LIMIT",
      "side": "BUY",
      "stopPrice": "0.0",
      "icebergQty": "0.0",
      "time": 1499827319559,
      "updateTime": 1499827319559,
      "isWorking": true,
      "origQuoteOrderQty": "0.000000"
    }),
    200,
    reasonPhrase: 'getTradeOrderOkClient',
  )),
);

late final MockClient cancelTradeOrderOkClient = MockClient(
  (Request request) => Future.value(Response(
    jsonEncode({
      "symbol": "LTCBTC",
      "origClientOrderId": "myOrder1",
      "orderId": 1,
      "orderListId": -1, //Unless part of an OCO, the value will always be -1.
      "clientOrderId": "cancelMyOrder1",
      "price": "2.00000000",
      "origQty": "1.00000000",
      "executedQty": "0.00000000",
      "cummulativeQuoteQty": "0.00000000",
      "status": "CANCELED",
      "timeInForce": "GTC",
      "type": "LIMIT",
      "side": "BUY"
    }),
    200,
    reasonPhrase: 'cancelTradeOrderOkClient',
  )),
);

late final MockClient ocoTradeOrderOkClient = MockClient(
  (Request request) => Future.value(Response(
    jsonEncode({
      "orderListId": 0,
      "contingencyType": "OCO",
      "listStatusType": "EXEC_STARTED",
      "listOrderStatus": "EXECUTING",
      "listClientOrderId": "JYVpp3F0f5CAG15DhtrqLp",
      "transactionTime": 1563417480525,
      "symbol": "LTCBTC",
      "orders": [
        {
          "symbol": "LTCBTC",
          "orderId": 2,
          "clientOrderId": "Kk7sqHb9J6mJWTMDVW7Vos"
        },
        {
          "symbol": "LTCBTC",
          "orderId": 3,
          "clientOrderId": "xTXKaGYd4bluPVp78IVRvl"
        }
      ],
      "orderReports": [
        {
          "symbol": "LTCBTC",
          "orderId": 2,
          "orderListId": 0,
          "clientOrderId": "Kk7sqHb9J6mJWTMDVW7Vos",
          "transactTime": 1563417480525,
          "price": "0.000000",
          "origQty": "0.624363",
          "executedQty": "0.000000",
          "cummulativeQuoteQty": "0.000000",
          "status": "NEW",
          "timeInForce": "GTC",
          "type": "STOP_LOSS",
          "side": "BUY",
          "stopPrice": "0.960664"
        },
        {
          "symbol": "LTCBTC",
          "orderId": 3,
          "orderListId": 0,
          "clientOrderId": "xTXKaGYd4bluPVp78IVRvl",
          "transactTime": 1563417480525,
          "price": "0.036435",
          "origQty": "0.624363",
          "executedQty": "0.000000",
          "cummulativeQuoteQty": "0.000000",
          "status": "NEW",
          "timeInForce": "GTC",
          "type": "LIMIT_MAKER",
          "side": "BUY"
        }
      ]
    }),
    200,
    reasonPhrase: 'ocoTradeOrderOkClient',
  )),
);
