// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BinanceOrderStatus _$$_BinanceOrderStatusFromJson(
        Map<String, dynamic> json) =>
    _$_BinanceOrderStatus(
      json['symbol'] as String,
      json['origClientOrderId'] as String?,
      json['orderId'] as int,
      json['orderListId'] as int,
      json['clientOrderId'] as String,
      json['transactTime'] as int?,
      json['price'] as String?,
      json['origQty'] as String?,
      json['executedQty'] as String?,
      json['cummulativeQuoteQty'] as String?,
      json['status'] as String?,
      json['timeInForce'] as String?,
      json['type'] as String?,
      json['side'] as String?,
      json['stopPrice'] as String?,
      json['icebergQty'] as String?,
      (json['fills'] as List<dynamic>?)
          ?.map((e) => BinanceOrderFill.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['time'] as int?,
      json['updateTime'] as int?,
      json['isWorking'] as bool?,
      json['origQuoteOrderQty'] as String?,
    );

Map<String, dynamic> _$$_BinanceOrderStatusToJson(
        _$_BinanceOrderStatus instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'origClientOrderId': instance.origClientOrderId,
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
      'stopPrice': instance.stopPrice,
      'icebergQty': instance.icebergQty,
      'fills': instance.fills,
      'time': instance.time,
      'updateTime': instance.updateTime,
      'isWorking': instance.isWorking,
      'origQuoteOrderQty': instance.origQuoteOrderQty,
    };
