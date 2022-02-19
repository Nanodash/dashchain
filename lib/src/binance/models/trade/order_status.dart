import 'package:dashchain/dashchain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_status.freezed.dart';
part 'order_status.g.dart';

@freezed
class BinanceOrderStatus with _$BinanceOrderStatus {
  factory BinanceOrderStatus(
    String symbol,
    String? origClientOrderId,
    int? orderId,
    int? orderListId,
    String? clientOrderId,
    int? transactTime,
    String? price,
    String? origQty,
    String? executedQty,
    String? cummulativeQuoteQty,
    String? status,
    String? timeInForce,
    String? type,
    String? side,
    String? stopPrice,
    String? icebergQty,
    List<BinanceOrderFill>? fills,
    int? time,
    int? updateTime,
    bool? isWorking,
    String? origQuoteOrderQty,
  ) = _BinanceOrderStatus;

  factory BinanceOrderStatus.fromJson(Map<String, dynamic> json) =>
      _$BinanceOrderStatusFromJson(json);

  factory BinanceOrderStatus.dry(String symbol) => BinanceOrderStatus(
        symbol,
        null,
        -1,
        -1,
        'dry',
        null,
        null,
        null,
        null,
        null,
        null,
        null,
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
