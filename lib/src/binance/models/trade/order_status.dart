import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_status.freezed.dart';
part 'order_status.g.dart';

@freezed
class BinanceOrderStatus with _$BinanceOrderStatus {
  factory BinanceOrderStatus(
    String symbol,
    int orderId,
    int orderListId,
    String clientOrderId,
    String price,
    String origQty,
    String executedQty,
    String cummulativeQuoteQty,
    String status,
    String timeInForce,
    String type,
    String side,
    String stopPrice,
    String icebergQty,
    int time,
    int updateTime,
    bool isWorking,
    String origQuoteOrderQty,
  ) = _BinanceOrderStatus;

  factory BinanceOrderStatus.fromJson(Map<String, dynamic> json) =>
      _$BinanceOrderStatusFromJson(json);
}
