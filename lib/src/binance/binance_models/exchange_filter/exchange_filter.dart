import 'package:freezed_annotation/freezed_annotation.dart';

part 'exchange_filter.freezed.dart';
part 'exchange_filter.g.dart';

@freezed
class ExchangeFilter with _$ExchangeFilter {
  factory ExchangeFilter(
    String filterType,
    int maxNumAlgoOrders,
  ) = _ExchangeFilter;

  factory ExchangeFilter.fromJson(Map<String, dynamic> json) =>
      _$ExchangeFilterFromJson(json);
}
