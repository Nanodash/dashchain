// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aggregated_trade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BinanceAggregatedTrade _$$_BinanceAggregatedTradeFromJson(
        Map<String, dynamic> json) =>
    _$_BinanceAggregatedTrade(
      json['a'] as int,
      json['p'] as String,
      json['q'] as String,
      json['f'] as int,
      json['l'] as int,
      json['T'] as int,
      json['m'] as bool,
      json['M'] as bool,
    );

Map<String, dynamic> _$$_BinanceAggregatedTradeToJson(
        _$_BinanceAggregatedTrade instance) =>
    <String, dynamic>{
      'a': instance.a,
      'p': instance.p,
      'q': instance.q,
      'f': instance.f,
      'l': instance.l,
      'T': instance.T,
      'm': instance.m,
      'M': instance.M,
    };
