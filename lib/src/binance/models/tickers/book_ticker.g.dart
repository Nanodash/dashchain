// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: non_constant_identifier_names

part of 'book_ticker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BinanceBookTicker _$$_BinanceBookTickerFromJson(Map<String, dynamic> json) =>
    _$_BinanceBookTicker(
      json['symbol'] as String,
      json['bidPrice'] as String,
      json['bidQty'] as String,
      json['askPrice'] as String,
      json['askQty'] as String,
    );

Map<String, dynamic> _$$_BinanceBookTickerToJson(
        _$_BinanceBookTicker instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'bidPrice': instance.bidPrice,
      'bidQty': instance.bidQty,
      'askPrice': instance.askPrice,
      'askQty': instance.askQty,
    };
