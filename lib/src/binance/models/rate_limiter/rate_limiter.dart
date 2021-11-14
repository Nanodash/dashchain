import 'package:freezed_annotation/freezed_annotation.dart';

part 'rate_limiter.freezed.dart';
part 'rate_limiter.g.dart';

@freezed
class BinanceRateLimiter with _$BinanceRateLimiter {
  factory BinanceRateLimiter(
    String rateLimitType,
    String interval,
    int intervalNum,
    int limit,
  ) = _BinanceRateLimiter;

  factory BinanceRateLimiter.fromJson(Map<String, dynamic> json) =>
      _$BinanceRateLimiterFromJson(json);
}
