import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:dashchain/src/binance/models/models.dart';

part 'exchange_info.freezed.dart';
part 'exchange_info.g.dart';

@freezed
class BinanceExchangeInfo with _$BinanceExchangeInfo {
  factory BinanceExchangeInfo(
    String timezone,
    int serverTime,
    List<BinanceRateLimiter> rateLimits,
    List<BinanceExchangeFilter> exchangeFilters,
    List<BinanceSymbol> symbols,
  ) = _BinanceExchangeInfo;

  factory BinanceExchangeInfo.fromJson(Map<String, dynamic> json) =>
      _$BinanceExchangeInfoFromJson(json);
}
