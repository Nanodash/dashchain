import 'package:freezed_annotation/freezed_annotation.dart';

part 'trade.freezed.dart';
part 'trade.g.dart';

@freezed
class BinanceTrade with _$BinanceTrade {
  factory BinanceTrade(
    int id,
    String price,
    String qty,
    String quoteQty,
    int time,
    bool isBuyerMaker,
    bool isBestMatch,
  ) = _BinanceTrade;

  factory BinanceTrade.fromJson(Map<String, dynamic> json) =>
      _$BinanceTradeFromJson(json);
}
