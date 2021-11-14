import 'package:freezed_annotation/freezed_annotation.dart';

part 'exchange_filter.freezed.dart';
part 'exchange_filter.g.dart';

@freezed
class BinanceExchangeFilter with _$BinanceExchangeFilter {
  factory BinanceExchangeFilter(
    String filterType,
    int maxNumAlgoOrders,
  ) = _BinanceExchangeFilter;

  factory BinanceExchangeFilter.fromJson(Map<String, dynamic> json) =>
      _$BinanceExchangeFilterFromJson(json);
}
