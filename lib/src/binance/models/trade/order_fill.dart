import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_fill.freezed.dart';
part 'order_fill.g.dart';

@freezed
class BinanceOrderFill with _$BinanceOrderFill {
  factory BinanceOrderFill(
    String price,
    String qty,
    String commission,
    String commissionAsset,
    int tradeId,
  ) = _BinanceOrderFill;

  factory BinanceOrderFill.fromJson(Map<String, dynamic> json) =>
      _$BinanceOrderFillFromJson(json);
}
