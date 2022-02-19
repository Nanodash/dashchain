// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trade_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BinanceTradeResponse _$$_BinanceTradeResponseFromJson(
        Map<String, dynamic> json) =>
    _$_BinanceTradeResponse(
      json['symbol'] as String,
      json['orderId'] as int,
      json['orderListId'] as int,
      json['clientOrderId'] as String,
      json['transactTime'] as int,
      json['price'] as String?,
      json['origQty'] as String?,
      json['executedQty'] as String?,
      json['cummulativeQuoteQty'] as String?,
      json['status'] as String?,
      json['timeInForce'] as String?,
      json['type'] as String?,
      json['side'] as String?,
      (json['fills'] as List<dynamic>?)
          ?.map((e) => BinanceOrderFill.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BinanceTradeResponseToJson(
        _$_BinanceTradeResponse instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'orderId': instance.orderId,
      'orderListId': instance.orderListId,
      'clientOrderId': instance.clientOrderId,
      'transactTime': instance.transactTime,
      'price': instance.price,
      'origQty': instance.origQty,
      'executedQty': instance.executedQty,
      'cummulativeQuoteQty': instance.cummulativeQuoteQty,
      'status': instance.status,
      'timeInForce': instance.timeInForce,
      'type': instance.type,
      'side': instance.side,
      'fills': instance.fills,
    };
