import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:dashchain/src/binance/models/models.dart';

part 'trade_response.freezed.dart';
part 'trade_response.g.dart';

@freezed
class BinanceTradeResponse with _$BinanceTradeResponse {
  factory BinanceTradeResponse(
    String symbol,
    int orderId,
    int orderListId,
    String clientOrderId,
    int transactTime,
    String? price,
    String? origQty,
    String? executedQty,
    String? cummulativeQuoteQty,
    String? status,
    String? timeInForce,
    String? type,
    String? side,
    List<BinanceOrderFill>? fills,
  ) = _BinanceTradeResponse;

  factory BinanceTradeResponse.fromJson(Map<String, dynamic> json) =>
      _$BinanceTradeResponseFromJson(json);

  factory BinanceTradeResponse.dry(String symbol) => BinanceTradeResponse(
        symbol,
        -1,
        -1,
        'testOrder',
        -1,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
      );
}
