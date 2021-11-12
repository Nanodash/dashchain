import 'package:freezed_annotation/freezed_annotation.dart';

part 'rate_limiter.freezed.dart';
part 'rate_limiter.g.dart';

@freezed
class RateLimiter with _$RateLimiter {
  factory RateLimiter(
    String rateLimitType,
    String interval,
    int intervalNum,
    int limit,
  ) = _RateLimiter;

  factory RateLimiter.fromJson(Map<String, dynamic> json) =>
      _$RateLimiterFromJson(json);
}
