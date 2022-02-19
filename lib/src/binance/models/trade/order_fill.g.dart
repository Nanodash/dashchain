// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: non_constant_identifier_names

part of 'order_fill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BinanceOrderFill _$$_BinanceOrderFillFromJson(Map<String, dynamic> json) =>
    _$_BinanceOrderFill(
      json['price'] as String,
      json['qty'] as String,
      json['commission'] as String,
      json['commissionAsset'] as String,
      json['tradeId'] as int,
    );

Map<String, dynamic> _$$_BinanceOrderFillToJson(_$_BinanceOrderFill instance) =>
    <String, dynamic>{
      'price': instance.price,
      'qty': instance.qty,
      'commission': instance.commission,
      'commissionAsset': instance.commissionAsset,
      'tradeId': instance.tradeId,
    };
