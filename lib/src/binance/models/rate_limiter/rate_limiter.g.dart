// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: non_constant_identifier_names

part of 'rate_limiter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BinanceRateLimiter _$$_BinanceRateLimiterFromJson(
        Map<String, dynamic> json) =>
    _$_BinanceRateLimiter(
      json['rateLimitType'] as String,
      json['interval'] as String,
      json['intervalNum'] as int,
      json['limit'] as int,
    );

Map<String, dynamic> _$$_BinanceRateLimiterToJson(
        _$_BinanceRateLimiter instance) =>
    <String, dynamic>{
      'rateLimitType': instance.rateLimitType,
      'interval': instance.interval,
      'intervalNum': instance.intervalNum,
      'limit': instance.limit,
    };
