// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BinanceOrderBook _$$_BinanceOrderBookFromJson(Map<String, dynamic> json) =>
    _$_BinanceOrderBook(
      json['lastUpdateId'] as int,
      (json['bids'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
      (json['asks'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
    );

Map<String, dynamic> _$$_BinanceOrderBookToJson(_$_BinanceOrderBook instance) =>
    <String, dynamic>{
      'lastUpdateId': instance.lastUpdateId,
      'bids': instance.bids,
      'asks': instance.asks,
    };
