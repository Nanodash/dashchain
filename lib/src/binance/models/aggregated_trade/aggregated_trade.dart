import 'package:freezed_annotation/freezed_annotation.dart';

part 'aggregated_trade.freezed.dart';
part 'aggregated_trade.g.dart';

@freezed
class BinanceAggregatedTrade with _$BinanceAggregatedTrade {
  factory BinanceAggregatedTrade(
    /// Aggregate tradeId
    int a,

    /// Price
    String p,

    /// Quantity
    String q,

    /// First tradeId
    int f,

    /// Last tradeId
    int l,

    /// Timestamp
    int T,

    /// Was the buyer the maker?
    bool m,

    /// Was the trade the best price match?
    bool M,
  ) = _BinanceAggregatedTrade;

  factory BinanceAggregatedTrade.fromJson(Map<String, dynamic> json) =>
      _$BinanceAggregatedTradeFromJson(json);
}
