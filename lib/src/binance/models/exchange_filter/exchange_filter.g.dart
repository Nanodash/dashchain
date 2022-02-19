// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BinanceExchangeFilter _$$_BinanceExchangeFilterFromJson(
        Map<String, dynamic> json) =>
    _$_BinanceExchangeFilter(
      json['filterType'] as String,
      json['maxNumAlgoOrders'] as int,
    );

Map<String, dynamic> _$$_BinanceExchangeFilterToJson(
        _$_BinanceExchangeFilter instance) =>
    <String, dynamic>{
      'filterType': instance.filterType,
      'maxNumAlgoOrders': instance.maxNumAlgoOrders,
    };
