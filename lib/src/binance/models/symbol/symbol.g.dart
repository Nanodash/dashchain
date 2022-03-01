// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: non_constant_identifier_names

part of 'symbol.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BinanceSymbol _$$_BinanceSymbolFromJson(Map<String, dynamic> json) =>
    _$_BinanceSymbol(
      json['symbol'] as String,
      json['status'] as String,
      json['baseAsset'] as String,
      json['baseAssetPrecision'] as int,
      json['quoteAsset'] as String,
      json['quotePrecision'] as int,
      json['quoteAssetPrecision'] as int,
      json['baseCommissionPrecision'] as int,
      json['quoteCommissionPrecision'] as int,
      (json['orderTypes'] as List<dynamic>).map((e) => e as String).toList(),
      json['icebergAllowed'] as bool,
      json['ocoAllowed'] as bool,
      json['quoteOrderQtyMarketAllowed'] as bool,
      json['isSpotTradingAllowed'] as bool,
      json['isMarginTradingAllowed'] as bool,
      (json['filters'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      (json['permissions'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_BinanceSymbolToJson(_$_BinanceSymbol instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'status': instance.status,
      'baseAsset': instance.baseAsset,
      'baseAssetPrecision': instance.baseAssetPrecision,
      'quoteAsset': instance.quoteAsset,
      'quotePrecision': instance.quotePrecision,
      'quoteAssetPrecision': instance.quoteAssetPrecision,
      'baseCommissionPrecision': instance.baseCommissionPrecision,
      'quoteCommissionPrecision': instance.quoteCommissionPrecision,
      'orderTypes': instance.orderTypes,
      'icebergAllowed': instance.icebergAllowed,
      'ocoAllowed': instance.ocoAllowed,
      'quoteOrderQtyMarketAllowed': instance.quoteOrderQtyMarketAllowed,
      'isSpotTradingAllowed': instance.isSpotTradingAllowed,
      'isMarginTradingAllowed': instance.isMarginTradingAllowed,
      'filters': instance.filters,
      'permissions': instance.permissions,
    };
