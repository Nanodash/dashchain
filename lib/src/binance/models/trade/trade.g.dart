// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BinanceTrade _$$_BinanceTradeFromJson(Map<String, dynamic> json) =>
    _$_BinanceTrade(
      json['id'] as int,
      json['price'] as String,
      json['qty'] as String,
      json['quoteQty'] as String,
      json['time'] as int,
      json['isBuyerMaker'] as bool,
      json['isBestMatch'] as bool,
    );

Map<String, dynamic> _$$_BinanceTradeToJson(_$_BinanceTrade instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'qty': instance.qty,
      'quoteQty': instance.quoteQty,
      'time': instance.time,
      'isBuyerMaker': instance.isBuyerMaker,
      'isBestMatch': instance.isBestMatch,
    };
