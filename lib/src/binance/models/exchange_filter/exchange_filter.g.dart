// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: non_constant_identifier_names

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
