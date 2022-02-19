// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'trade.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BinanceTrade _$BinanceTradeFromJson(Map<String, dynamic> json) {
  return _BinanceTrade.fromJson(json);
}

/// @nodoc
class _$BinanceTradeTearOff {
  const _$BinanceTradeTearOff();

  _BinanceTrade call(int id, String price, String qty, String quoteQty,
      int time, bool isBuyerMaker, bool isBestMatch) {
    return _BinanceTrade(
      id,
      price,
      qty,
      quoteQty,
      time,
      isBuyerMaker,
      isBestMatch,
    );
  }

  BinanceTrade fromJson(Map<String, Object?> json) {
    return BinanceTrade.fromJson(json);
  }
}

/// @nodoc
const $BinanceTrade = _$BinanceTradeTearOff();

/// @nodoc
mixin _$BinanceTrade {
  int get id => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get qty => throw _privateConstructorUsedError;
  String get quoteQty => throw _privateConstructorUsedError;
  int get time => throw _privateConstructorUsedError;
  bool get isBuyerMaker => throw _privateConstructorUsedError;
  bool get isBestMatch => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BinanceTradeCopyWith<BinanceTrade> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BinanceTradeCopyWith<$Res> {
  factory $BinanceTradeCopyWith(
          BinanceTrade value, $Res Function(BinanceTrade) then) =
      _$BinanceTradeCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String price,
      String qty,
      String quoteQty,
      int time,
      bool isBuyerMaker,
      bool isBestMatch});
}

/// @nodoc
class _$BinanceTradeCopyWithImpl<$Res> implements $BinanceTradeCopyWith<$Res> {
  _$BinanceTradeCopyWithImpl(this._value, this._then);

  final BinanceTrade _value;
  // ignore: unused_field
  final $Res Function(BinanceTrade) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? price = freezed,
    Object? qty = freezed,
    Object? quoteQty = freezed,
    Object? time = freezed,
    Object? isBuyerMaker = freezed,
    Object? isBestMatch = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      qty: qty == freezed
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as String,
      quoteQty: quoteQty == freezed
          ? _value.quoteQty
          : quoteQty // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      isBuyerMaker: isBuyerMaker == freezed
          ? _value.isBuyerMaker
          : isBuyerMaker // ignore: cast_nullable_to_non_nullable
              as bool,
      isBestMatch: isBestMatch == freezed
          ? _value.isBestMatch
          : isBestMatch // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$BinanceTradeCopyWith<$Res>
    implements $BinanceTradeCopyWith<$Res> {
  factory _$BinanceTradeCopyWith(
          _BinanceTrade value, $Res Function(_BinanceTrade) then) =
      __$BinanceTradeCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String price,
      String qty,
      String quoteQty,
      int time,
      bool isBuyerMaker,
      bool isBestMatch});
}

/// @nodoc
class __$BinanceTradeCopyWithImpl<$Res> extends _$BinanceTradeCopyWithImpl<$Res>
    implements _$BinanceTradeCopyWith<$Res> {
  __$BinanceTradeCopyWithImpl(
      _BinanceTrade _value, $Res Function(_BinanceTrade) _then)
      : super(_value, (v) => _then(v as _BinanceTrade));

  @override
  _BinanceTrade get _value => super._value as _BinanceTrade;

  @override
  $Res call({
    Object? id = freezed,
    Object? price = freezed,
    Object? qty = freezed,
    Object? quoteQty = freezed,
    Object? time = freezed,
    Object? isBuyerMaker = freezed,
    Object? isBestMatch = freezed,
  }) {
    return _then(_BinanceTrade(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      qty == freezed
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as String,
      quoteQty == freezed
          ? _value.quoteQty
          : quoteQty // ignore: cast_nullable_to_non_nullable
              as String,
      time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      isBuyerMaker == freezed
          ? _value.isBuyerMaker
          : isBuyerMaker // ignore: cast_nullable_to_non_nullable
              as bool,
      isBestMatch == freezed
          ? _value.isBestMatch
          : isBestMatch // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BinanceTrade implements _BinanceTrade {
  _$_BinanceTrade(this.id, this.price, this.qty, this.quoteQty, this.time,
      this.isBuyerMaker, this.isBestMatch);

  factory _$_BinanceTrade.fromJson(Map<String, dynamic> json) =>
      _$$_BinanceTradeFromJson(json);

  @override
  final int id;
  @override
  final String price;
  @override
  final String qty;
  @override
  final String quoteQty;
  @override
  final int time;
  @override
  final bool isBuyerMaker;
  @override
  final bool isBestMatch;

  @override
  String toString() {
    return 'BinanceTrade(id: $id, price: $price, qty: $qty, quoteQty: $quoteQty, time: $time, isBuyerMaker: $isBuyerMaker, isBestMatch: $isBestMatch)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BinanceTrade &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.qty, qty) &&
            const DeepCollectionEquality().equals(other.quoteQty, quoteQty) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality()
                .equals(other.isBuyerMaker, isBuyerMaker) &&
            const DeepCollectionEquality()
                .equals(other.isBestMatch, isBestMatch));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(qty),
      const DeepCollectionEquality().hash(quoteQty),
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(isBuyerMaker),
      const DeepCollectionEquality().hash(isBestMatch));

  @JsonKey(ignore: true)
  @override
  _$BinanceTradeCopyWith<_BinanceTrade> get copyWith =>
      __$BinanceTradeCopyWithImpl<_BinanceTrade>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BinanceTradeToJson(this);
  }
}

abstract class _BinanceTrade implements BinanceTrade {
  factory _BinanceTrade(int id, String price, String qty, String quoteQty,
      int time, bool isBuyerMaker, bool isBestMatch) = _$_BinanceTrade;

  factory _BinanceTrade.fromJson(Map<String, dynamic> json) =
      _$_BinanceTrade.fromJson;

  @override
  int get id;
  @override
  String get price;
  @override
  String get qty;
  @override
  String get quoteQty;
  @override
  int get time;
  @override
  bool get isBuyerMaker;
  @override
  bool get isBestMatch;
  @override
  @JsonKey(ignore: true)
  _$BinanceTradeCopyWith<_BinanceTrade> get copyWith =>
      throw _privateConstructorUsedError;
}
