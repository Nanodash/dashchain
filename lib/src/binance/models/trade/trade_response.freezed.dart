// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'trade_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BinanceTradeResponse _$BinanceTradeResponseFromJson(Map<String, dynamic> json) {
  return _BinanceTradeResponse.fromJson(json);
}

/// @nodoc
class _$BinanceTradeResponseTearOff {
  const _$BinanceTradeResponseTearOff();

  _BinanceTradeResponse call(
      String symbol,
      int orderId,
      int orderListId,
      String clientOrderId,
      int transactTime,
      String? price,
      String? origQty,
      String? executedQty,
      String? cummulativeQuoteQty,
      String? status,
      String? timeInForce,
      String? type,
      String? side,
      List<BinanceOrderFill>? fills) {
    return _BinanceTradeResponse(
      symbol,
      orderId,
      orderListId,
      clientOrderId,
      transactTime,
      price,
      origQty,
      executedQty,
      cummulativeQuoteQty,
      status,
      timeInForce,
      type,
      side,
      fills,
    );
  }

  BinanceTradeResponse fromJson(Map<String, Object?> json) {
    return BinanceTradeResponse.fromJson(json);
  }
}

/// @nodoc
const $BinanceTradeResponse = _$BinanceTradeResponseTearOff();

/// @nodoc
mixin _$BinanceTradeResponse {
  String get symbol => throw _privateConstructorUsedError;
  int get orderId => throw _privateConstructorUsedError;
  int get orderListId => throw _privateConstructorUsedError;
  String get clientOrderId => throw _privateConstructorUsedError;
  int get transactTime => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  String? get origQty => throw _privateConstructorUsedError;
  String? get executedQty => throw _privateConstructorUsedError;
  String? get cummulativeQuoteQty => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get timeInForce => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get side => throw _privateConstructorUsedError;
  List<BinanceOrderFill>? get fills => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BinanceTradeResponseCopyWith<BinanceTradeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BinanceTradeResponseCopyWith<$Res> {
  factory $BinanceTradeResponseCopyWith(BinanceTradeResponse value,
          $Res Function(BinanceTradeResponse) then) =
      _$BinanceTradeResponseCopyWithImpl<$Res>;
  $Res call(
      {String symbol,
      int orderId,
      int orderListId,
      String clientOrderId,
      int transactTime,
      String? price,
      String? origQty,
      String? executedQty,
      String? cummulativeQuoteQty,
      String? status,
      String? timeInForce,
      String? type,
      String? side,
      List<BinanceOrderFill>? fills});
}

/// @nodoc
class _$BinanceTradeResponseCopyWithImpl<$Res>
    implements $BinanceTradeResponseCopyWith<$Res> {
  _$BinanceTradeResponseCopyWithImpl(this._value, this._then);

  final BinanceTradeResponse _value;
  // ignore: unused_field
  final $Res Function(BinanceTradeResponse) _then;

  @override
  $Res call({
    Object? symbol = freezed,
    Object? orderId = freezed,
    Object? orderListId = freezed,
    Object? clientOrderId = freezed,
    Object? transactTime = freezed,
    Object? price = freezed,
    Object? origQty = freezed,
    Object? executedQty = freezed,
    Object? cummulativeQuoteQty = freezed,
    Object? status = freezed,
    Object? timeInForce = freezed,
    Object? type = freezed,
    Object? side = freezed,
    Object? fills = freezed,
  }) {
    return _then(_value.copyWith(
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
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
      transactTime: transactTime == freezed
          ? _value.transactTime
          : transactTime // ignore: cast_nullable_to_non_nullable
              as int,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      origQty: origQty == freezed
          ? _value.origQty
          : origQty // ignore: cast_nullable_to_non_nullable
              as String?,
      executedQty: executedQty == freezed
          ? _value.executedQty
          : executedQty // ignore: cast_nullable_to_non_nullable
              as String?,
      cummulativeQuoteQty: cummulativeQuoteQty == freezed
          ? _value.cummulativeQuoteQty
          : cummulativeQuoteQty // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      timeInForce: timeInForce == freezed
          ? _value.timeInForce
          : timeInForce // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      side: side == freezed
          ? _value.side
          : side // ignore: cast_nullable_to_non_nullable
              as String?,
      fills: fills == freezed
          ? _value.fills
          : fills // ignore: cast_nullable_to_non_nullable
              as List<BinanceOrderFill>?,
    ));
  }
}

/// @nodoc
abstract class _$BinanceTradeResponseCopyWith<$Res>
    implements $BinanceTradeResponseCopyWith<$Res> {
  factory _$BinanceTradeResponseCopyWith(_BinanceTradeResponse value,
          $Res Function(_BinanceTradeResponse) then) =
      __$BinanceTradeResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String symbol,
      int orderId,
      int orderListId,
      String clientOrderId,
      int transactTime,
      String? price,
      String? origQty,
      String? executedQty,
      String? cummulativeQuoteQty,
      String? status,
      String? timeInForce,
      String? type,
      String? side,
      List<BinanceOrderFill>? fills});
}

/// @nodoc
class __$BinanceTradeResponseCopyWithImpl<$Res>
    extends _$BinanceTradeResponseCopyWithImpl<$Res>
    implements _$BinanceTradeResponseCopyWith<$Res> {
  __$BinanceTradeResponseCopyWithImpl(
      _BinanceTradeResponse _value, $Res Function(_BinanceTradeResponse) _then)
      : super(_value, (v) => _then(v as _BinanceTradeResponse));

  @override
  _BinanceTradeResponse get _value => super._value as _BinanceTradeResponse;

  @override
  $Res call({
    Object? symbol = freezed,
    Object? orderId = freezed,
    Object? orderListId = freezed,
    Object? clientOrderId = freezed,
    Object? transactTime = freezed,
    Object? price = freezed,
    Object? origQty = freezed,
    Object? executedQty = freezed,
    Object? cummulativeQuoteQty = freezed,
    Object? status = freezed,
    Object? timeInForce = freezed,
    Object? type = freezed,
    Object? side = freezed,
    Object? fills = freezed,
  }) {
    return _then(_BinanceTradeResponse(
      symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
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
      transactTime == freezed
          ? _value.transactTime
          : transactTime // ignore: cast_nullable_to_non_nullable
              as int,
      price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      origQty == freezed
          ? _value.origQty
          : origQty // ignore: cast_nullable_to_non_nullable
              as String?,
      executedQty == freezed
          ? _value.executedQty
          : executedQty // ignore: cast_nullable_to_non_nullable
              as String?,
      cummulativeQuoteQty == freezed
          ? _value.cummulativeQuoteQty
          : cummulativeQuoteQty // ignore: cast_nullable_to_non_nullable
              as String?,
      status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      timeInForce == freezed
          ? _value.timeInForce
          : timeInForce // ignore: cast_nullable_to_non_nullable
              as String?,
      type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      side == freezed
          ? _value.side
          : side // ignore: cast_nullable_to_non_nullable
              as String?,
      fills == freezed
          ? _value.fills
          : fills // ignore: cast_nullable_to_non_nullable
              as List<BinanceOrderFill>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BinanceTradeResponse implements _BinanceTradeResponse {
  _$_BinanceTradeResponse(
      this.symbol,
      this.orderId,
      this.orderListId,
      this.clientOrderId,
      this.transactTime,
      this.price,
      this.origQty,
      this.executedQty,
      this.cummulativeQuoteQty,
      this.status,
      this.timeInForce,
      this.type,
      this.side,
      this.fills);

  factory _$_BinanceTradeResponse.fromJson(Map<String, dynamic> json) =>
      _$$_BinanceTradeResponseFromJson(json);

  @override
  final String symbol;
  @override
  final int orderId;
  @override
  final int orderListId;
  @override
  final String clientOrderId;
  @override
  final int transactTime;
  @override
  final String? price;
  @override
  final String? origQty;
  @override
  final String? executedQty;
  @override
  final String? cummulativeQuoteQty;
  @override
  final String? status;
  @override
  final String? timeInForce;
  @override
  final String? type;
  @override
  final String? side;
  @override
  final List<BinanceOrderFill>? fills;

  @override
  String toString() {
    return 'BinanceTradeResponse(symbol: $symbol, orderId: $orderId, orderListId: $orderListId, clientOrderId: $clientOrderId, transactTime: $transactTime, price: $price, origQty: $origQty, executedQty: $executedQty, cummulativeQuoteQty: $cummulativeQuoteQty, status: $status, timeInForce: $timeInForce, type: $type, side: $side, fills: $fills)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BinanceTradeResponse &&
            const DeepCollectionEquality().equals(other.symbol, symbol) &&
            const DeepCollectionEquality().equals(other.orderId, orderId) &&
            const DeepCollectionEquality()
                .equals(other.orderListId, orderListId) &&
            const DeepCollectionEquality()
                .equals(other.clientOrderId, clientOrderId) &&
            const DeepCollectionEquality()
                .equals(other.transactTime, transactTime) &&
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
            const DeepCollectionEquality().equals(other.fills, fills));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(symbol),
      const DeepCollectionEquality().hash(orderId),
      const DeepCollectionEquality().hash(orderListId),
      const DeepCollectionEquality().hash(clientOrderId),
      const DeepCollectionEquality().hash(transactTime),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(origQty),
      const DeepCollectionEquality().hash(executedQty),
      const DeepCollectionEquality().hash(cummulativeQuoteQty),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(timeInForce),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(side),
      const DeepCollectionEquality().hash(fills));

  @JsonKey(ignore: true)
  @override
  _$BinanceTradeResponseCopyWith<_BinanceTradeResponse> get copyWith =>
      __$BinanceTradeResponseCopyWithImpl<_BinanceTradeResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BinanceTradeResponseToJson(this);
  }
}

abstract class _BinanceTradeResponse implements BinanceTradeResponse {
  factory _BinanceTradeResponse(
      String symbol,
      int orderId,
      int orderListId,
      String clientOrderId,
      int transactTime,
      String? price,
      String? origQty,
      String? executedQty,
      String? cummulativeQuoteQty,
      String? status,
      String? timeInForce,
      String? type,
      String? side,
      List<BinanceOrderFill>? fills) = _$_BinanceTradeResponse;

  factory _BinanceTradeResponse.fromJson(Map<String, dynamic> json) =
      _$_BinanceTradeResponse.fromJson;

  @override
  String get symbol;
  @override
  int get orderId;
  @override
  int get orderListId;
  @override
  String get clientOrderId;
  @override
  int get transactTime;
  @override
  String? get price;
  @override
  String? get origQty;
  @override
  String? get executedQty;
  @override
  String? get cummulativeQuoteQty;
  @override
  String? get status;
  @override
  String? get timeInForce;
  @override
  String? get type;
  @override
  String? get side;
  @override
  List<BinanceOrderFill>? get fills;
  @override
  @JsonKey(ignore: true)
  _$BinanceTradeResponseCopyWith<_BinanceTradeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
