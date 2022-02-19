// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BinanceOrderStatus _$BinanceOrderStatusFromJson(Map<String, dynamic> json) {
  return _BinanceOrderStatus.fromJson(json);
}

/// @nodoc
class _$BinanceOrderStatusTearOff {
  const _$BinanceOrderStatusTearOff();

  _BinanceOrderStatus call(
      String symbol,
      String? origClientOrderId,
      int orderId,
      int orderListId,
      String clientOrderId,
      String price,
      String origQty,
      String executedQty,
      String cummulativeQuoteQty,
      String status,
      String timeInForce,
      String type,
      String side,
      String? stopPrice,
      String? icebergQty,
      int? time,
      int? updateTime,
      bool? isWorking,
      String? origQuoteOrderQty) {
    return _BinanceOrderStatus(
      symbol,
      origClientOrderId,
      orderId,
      orderListId,
      clientOrderId,
      price,
      origQty,
      executedQty,
      cummulativeQuoteQty,
      status,
      timeInForce,
      type,
      side,
      stopPrice,
      icebergQty,
      time,
      updateTime,
      isWorking,
      origQuoteOrderQty,
    );
  }

  BinanceOrderStatus fromJson(Map<String, Object?> json) {
    return BinanceOrderStatus.fromJson(json);
  }
}

/// @nodoc
const $BinanceOrderStatus = _$BinanceOrderStatusTearOff();

/// @nodoc
mixin _$BinanceOrderStatus {
  String get symbol => throw _privateConstructorUsedError;
  String? get origClientOrderId => throw _privateConstructorUsedError;
  int get orderId => throw _privateConstructorUsedError;
  int get orderListId => throw _privateConstructorUsedError;
  String get clientOrderId => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get origQty => throw _privateConstructorUsedError;
  String get executedQty => throw _privateConstructorUsedError;
  String get cummulativeQuoteQty => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get timeInForce => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get side => throw _privateConstructorUsedError;
  String? get stopPrice => throw _privateConstructorUsedError;
  String? get icebergQty => throw _privateConstructorUsedError;
  int? get time => throw _privateConstructorUsedError;
  int? get updateTime => throw _privateConstructorUsedError;
  bool? get isWorking => throw _privateConstructorUsedError;
  String? get origQuoteOrderQty => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BinanceOrderStatusCopyWith<BinanceOrderStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BinanceOrderStatusCopyWith<$Res> {
  factory $BinanceOrderStatusCopyWith(
          BinanceOrderStatus value, $Res Function(BinanceOrderStatus) then) =
      _$BinanceOrderStatusCopyWithImpl<$Res>;
  $Res call(
      {String symbol,
      String? origClientOrderId,
      int orderId,
      int orderListId,
      String clientOrderId,
      String price,
      String origQty,
      String executedQty,
      String cummulativeQuoteQty,
      String status,
      String timeInForce,
      String type,
      String side,
      String? stopPrice,
      String? icebergQty,
      int? time,
      int? updateTime,
      bool? isWorking,
      String? origQuoteOrderQty});
}

/// @nodoc
class _$BinanceOrderStatusCopyWithImpl<$Res>
    implements $BinanceOrderStatusCopyWith<$Res> {
  _$BinanceOrderStatusCopyWithImpl(this._value, this._then);

  final BinanceOrderStatus _value;
  // ignore: unused_field
  final $Res Function(BinanceOrderStatus) _then;

  @override
  $Res call({
    Object? symbol = freezed,
    Object? origClientOrderId = freezed,
    Object? orderId = freezed,
    Object? orderListId = freezed,
    Object? clientOrderId = freezed,
    Object? price = freezed,
    Object? origQty = freezed,
    Object? executedQty = freezed,
    Object? cummulativeQuoteQty = freezed,
    Object? status = freezed,
    Object? timeInForce = freezed,
    Object? type = freezed,
    Object? side = freezed,
    Object? stopPrice = freezed,
    Object? icebergQty = freezed,
    Object? time = freezed,
    Object? updateTime = freezed,
    Object? isWorking = freezed,
    Object? origQuoteOrderQty = freezed,
  }) {
    return _then(_value.copyWith(
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      origClientOrderId: origClientOrderId == freezed
          ? _value.origClientOrderId
          : origClientOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      orderListId: orderListId == freezed
          ? _value.orderListId
          : orderListId // ignore: cast_nullable_to_non_nullable
              as int,
      clientOrderId: clientOrderId == freezed
          ? _value.clientOrderId
          : clientOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      origQty: origQty == freezed
          ? _value.origQty
          : origQty // ignore: cast_nullable_to_non_nullable
              as String,
      executedQty: executedQty == freezed
          ? _value.executedQty
          : executedQty // ignore: cast_nullable_to_non_nullable
              as String,
      cummulativeQuoteQty: cummulativeQuoteQty == freezed
          ? _value.cummulativeQuoteQty
          : cummulativeQuoteQty // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      timeInForce: timeInForce == freezed
          ? _value.timeInForce
          : timeInForce // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      side: side == freezed
          ? _value.side
          : side // ignore: cast_nullable_to_non_nullable
              as String,
      stopPrice: stopPrice == freezed
          ? _value.stopPrice
          : stopPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      icebergQty: icebergQty == freezed
          ? _value.icebergQty
          : icebergQty // ignore: cast_nullable_to_non_nullable
              as String?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int?,
      updateTime: updateTime == freezed
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as int?,
      isWorking: isWorking == freezed
          ? _value.isWorking
          : isWorking // ignore: cast_nullable_to_non_nullable
              as bool?,
      origQuoteOrderQty: origQuoteOrderQty == freezed
          ? _value.origQuoteOrderQty
          : origQuoteOrderQty // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$BinanceOrderStatusCopyWith<$Res>
    implements $BinanceOrderStatusCopyWith<$Res> {
  factory _$BinanceOrderStatusCopyWith(
          _BinanceOrderStatus value, $Res Function(_BinanceOrderStatus) then) =
      __$BinanceOrderStatusCopyWithImpl<$Res>;
  @override
  $Res call(
      {String symbol,
      String? origClientOrderId,
      int orderId,
      int orderListId,
      String clientOrderId,
      String price,
      String origQty,
      String executedQty,
      String cummulativeQuoteQty,
      String status,
      String timeInForce,
      String type,
      String side,
      String? stopPrice,
      String? icebergQty,
      int? time,
      int? updateTime,
      bool? isWorking,
      String? origQuoteOrderQty});
}

/// @nodoc
class __$BinanceOrderStatusCopyWithImpl<$Res>
    extends _$BinanceOrderStatusCopyWithImpl<$Res>
    implements _$BinanceOrderStatusCopyWith<$Res> {
  __$BinanceOrderStatusCopyWithImpl(
      _BinanceOrderStatus _value, $Res Function(_BinanceOrderStatus) _then)
      : super(_value, (v) => _then(v as _BinanceOrderStatus));

  @override
  _BinanceOrderStatus get _value => super._value as _BinanceOrderStatus;

  @override
  $Res call({
    Object? symbol = freezed,
    Object? origClientOrderId = freezed,
    Object? orderId = freezed,
    Object? orderListId = freezed,
    Object? clientOrderId = freezed,
    Object? price = freezed,
    Object? origQty = freezed,
    Object? executedQty = freezed,
    Object? cummulativeQuoteQty = freezed,
    Object? status = freezed,
    Object? timeInForce = freezed,
    Object? type = freezed,
    Object? side = freezed,
    Object? stopPrice = freezed,
    Object? icebergQty = freezed,
    Object? time = freezed,
    Object? updateTime = freezed,
    Object? isWorking = freezed,
    Object? origQuoteOrderQty = freezed,
  }) {
    return _then(_BinanceOrderStatus(
      symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      origClientOrderId == freezed
          ? _value.origClientOrderId
          : origClientOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      orderListId == freezed
          ? _value.orderListId
          : orderListId // ignore: cast_nullable_to_non_nullable
              as int,
      clientOrderId == freezed
          ? _value.clientOrderId
          : clientOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      origQty == freezed
          ? _value.origQty
          : origQty // ignore: cast_nullable_to_non_nullable
              as String,
      executedQty == freezed
          ? _value.executedQty
          : executedQty // ignore: cast_nullable_to_non_nullable
              as String,
      cummulativeQuoteQty == freezed
          ? _value.cummulativeQuoteQty
          : cummulativeQuoteQty // ignore: cast_nullable_to_non_nullable
              as String,
      status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      timeInForce == freezed
          ? _value.timeInForce
          : timeInForce // ignore: cast_nullable_to_non_nullable
              as String,
      type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      side == freezed
          ? _value.side
          : side // ignore: cast_nullable_to_non_nullable
              as String,
      stopPrice == freezed
          ? _value.stopPrice
          : stopPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      icebergQty == freezed
          ? _value.icebergQty
          : icebergQty // ignore: cast_nullable_to_non_nullable
              as String?,
      time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int?,
      updateTime == freezed
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as int?,
      isWorking == freezed
          ? _value.isWorking
          : isWorking // ignore: cast_nullable_to_non_nullable
              as bool?,
      origQuoteOrderQty == freezed
          ? _value.origQuoteOrderQty
          : origQuoteOrderQty // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BinanceOrderStatus implements _BinanceOrderStatus {
  _$_BinanceOrderStatus(
      this.symbol,
      this.origClientOrderId,
      this.orderId,
      this.orderListId,
      this.clientOrderId,
      this.price,
      this.origQty,
      this.executedQty,
      this.cummulativeQuoteQty,
      this.status,
      this.timeInForce,
      this.type,
      this.side,
      this.stopPrice,
      this.icebergQty,
      this.time,
      this.updateTime,
      this.isWorking,
      this.origQuoteOrderQty);

  factory _$_BinanceOrderStatus.fromJson(Map<String, dynamic> json) =>
      _$$_BinanceOrderStatusFromJson(json);

  @override
  final String symbol;
  @override
  final String? origClientOrderId;
  @override
  final int orderId;
  @override
  final int orderListId;
  @override
  final String clientOrderId;
  @override
  final String price;
  @override
  final String origQty;
  @override
  final String executedQty;
  @override
  final String cummulativeQuoteQty;
  @override
  final String status;
  @override
  final String timeInForce;
  @override
  final String type;
  @override
  final String side;
  @override
  final String? stopPrice;
  @override
  final String? icebergQty;
  @override
  final int? time;
  @override
  final int? updateTime;
  @override
  final bool? isWorking;
  @override
  final String? origQuoteOrderQty;

  @override
  String toString() {
    return 'BinanceOrderStatus(symbol: $symbol, origClientOrderId: $origClientOrderId, orderId: $orderId, orderListId: $orderListId, clientOrderId: $clientOrderId, price: $price, origQty: $origQty, executedQty: $executedQty, cummulativeQuoteQty: $cummulativeQuoteQty, status: $status, timeInForce: $timeInForce, type: $type, side: $side, stopPrice: $stopPrice, icebergQty: $icebergQty, time: $time, updateTime: $updateTime, isWorking: $isWorking, origQuoteOrderQty: $origQuoteOrderQty)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BinanceOrderStatus &&
            const DeepCollectionEquality().equals(other.symbol, symbol) &&
            const DeepCollectionEquality()
                .equals(other.origClientOrderId, origClientOrderId) &&
            const DeepCollectionEquality().equals(other.orderId, orderId) &&
            const DeepCollectionEquality()
                .equals(other.orderListId, orderListId) &&
            const DeepCollectionEquality()
                .equals(other.clientOrderId, clientOrderId) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.origQty, origQty) &&
            const DeepCollectionEquality()
                .equals(other.executedQty, executedQty) &&
            const DeepCollectionEquality()
                .equals(other.cummulativeQuoteQty, cummulativeQuoteQty) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.timeInForce, timeInForce) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.side, side) &&
            const DeepCollectionEquality().equals(other.stopPrice, stopPrice) &&
            const DeepCollectionEquality()
                .equals(other.icebergQty, icebergQty) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality()
                .equals(other.updateTime, updateTime) &&
            const DeepCollectionEquality().equals(other.isWorking, isWorking) &&
            const DeepCollectionEquality()
                .equals(other.origQuoteOrderQty, origQuoteOrderQty));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(symbol),
        const DeepCollectionEquality().hash(origClientOrderId),
        const DeepCollectionEquality().hash(orderId),
        const DeepCollectionEquality().hash(orderListId),
        const DeepCollectionEquality().hash(clientOrderId),
        const DeepCollectionEquality().hash(price),
        const DeepCollectionEquality().hash(origQty),
        const DeepCollectionEquality().hash(executedQty),
        const DeepCollectionEquality().hash(cummulativeQuoteQty),
        const DeepCollectionEquality().hash(status),
        const DeepCollectionEquality().hash(timeInForce),
        const DeepCollectionEquality().hash(type),
        const DeepCollectionEquality().hash(side),
        const DeepCollectionEquality().hash(stopPrice),
        const DeepCollectionEquality().hash(icebergQty),
        const DeepCollectionEquality().hash(time),
        const DeepCollectionEquality().hash(updateTime),
        const DeepCollectionEquality().hash(isWorking),
        const DeepCollectionEquality().hash(origQuoteOrderQty)
      ]);

  @JsonKey(ignore: true)
  @override
  _$BinanceOrderStatusCopyWith<_BinanceOrderStatus> get copyWith =>
      __$BinanceOrderStatusCopyWithImpl<_BinanceOrderStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BinanceOrderStatusToJson(this);
  }
}

abstract class _BinanceOrderStatus implements BinanceOrderStatus {
  factory _BinanceOrderStatus(
      String symbol,
      String? origClientOrderId,
      int orderId,
      int orderListId,
      String clientOrderId,
      String price,
      String origQty,
      String executedQty,
      String cummulativeQuoteQty,
      String status,
      String timeInForce,
      String type,
      String side,
      String? stopPrice,
      String? icebergQty,
      int? time,
      int? updateTime,
      bool? isWorking,
      String? origQuoteOrderQty) = _$_BinanceOrderStatus;

  factory _BinanceOrderStatus.fromJson(Map<String, dynamic> json) =
      _$_BinanceOrderStatus.fromJson;

  @override
  String get symbol;
  @override
  String? get origClientOrderId;
  @override
  int get orderId;
  @override
  int get orderListId;
  @override
  String get clientOrderId;
  @override
  String get price;
  @override
  String get origQty;
  @override
  String get executedQty;
  @override
  String get cummulativeQuoteQty;
  @override
  String get status;
  @override
  String get timeInForce;
  @override
  String get type;
  @override
  String get side;
  @override
  String? get stopPrice;
  @override
  String? get icebergQty;
  @override
  int? get time;
  @override
  int? get updateTime;
  @override
  bool? get isWorking;
  @override
  String? get origQuoteOrderQty;
  @override
  @JsonKey(ignore: true)
  _$BinanceOrderStatusCopyWith<_BinanceOrderStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
