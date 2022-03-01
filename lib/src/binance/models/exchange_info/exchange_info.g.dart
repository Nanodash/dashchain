// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: non_constant_identifier_names

part of 'exchange_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BinanceExchangeInfo _$$_BinanceExchangeInfoFromJson(
        Map<String, dynamic> json) =>
    _$_BinanceExchangeInfo(
      json['timezone'] as String,
      json['serverTime'] as int,
      (json['rateLimits'] as List<dynamic>)
          .map((e) => BinanceRateLimiter.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['exchangeFilters'] as List<dynamic>)
          .map((e) => BinanceExchangeFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['symbols'] as List<dynamic>)
          .map((e) => BinanceSymbol.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BinanceExchangeInfoToJson(
        _$_BinanceExchangeInfo instance) =>
    <String, dynamic>{
      'timezone': instance.timezone,
      'serverTime': instance.serverTime,
      'rateLimits': instance.rateLimits,
      'exchangeFilters': instance.exchangeFilters,
      'symbols': instance.symbols,
    };
