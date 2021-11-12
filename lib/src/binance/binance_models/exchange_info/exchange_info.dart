import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:dashchain/src/binance/binance_models/binance_models.dart';
part 'exchange_info.freezed.dart';
part 'exchange_info.g.dart';

@freezed
class ExchangeInfo with _$ExchangeInfo {
  factory ExchangeInfo(
    String timezone,
    int serverTime,
    List<RateLimiter> rateLimits,
    List<ExchangeFilter> exchangeFilters,
    List<BinanceSymbol> symbols,
  ) = _ExchangeInfo;

  factory ExchangeInfo.fromJson(Map<String, dynamic> json) =>
      _$ExchangeInfoFromJson(json);
}
