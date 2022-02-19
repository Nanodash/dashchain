// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'book_ticker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BinanceBookTicker _$BinanceBookTickerFromJson(Map<String, dynamic> json) {
  return _BinanceBookTicker.fromJson(json);
}

/// @nodoc
class _$BinanceBookTickerTearOff {
  const _$BinanceBookTickerTearOff();

  _BinanceBookTicker call(String symbol, String bidPrice, String bidQty,
      String askPrice, String askQty) {
    return _BinanceBookTicker(
      symbol,
      bidPrice,
      bidQty,
      askPrice,
      askQty,
    );
  }

  BinanceBookTicker fromJson(Map<String, Object?> json) {
    return BinanceBookTicker.fromJson(json);
  }
}

/// @nodoc
const $BinanceBookTicker = _$BinanceBookTickerTearOff();

/// @nodoc
mixin _$BinanceBookTicker {
  String get symbol => throw _privateConstructorUsedError;
  String get bidPrice => throw _privateConstructorUsedError;
  String get bidQty => throw _privateConstructorUsedError;
  String get askPrice => throw _privateConstructorUsedError;
  String get askQty => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BinanceBookTickerCopyWith<BinanceBookTicker> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BinanceBookTickerCopyWith<$Res> {
  factory $BinanceBookTickerCopyWith(
          BinanceBookTicker value, $Res Function(BinanceBookTicker) then) =
      _$BinanceBookTickerCopyWithImpl<$Res>;
  $Res call(
      {String symbol,
      String bidPrice,
      String bidQty,
      String askPrice,
      String askQty});
}

/// @nodoc
class _$BinanceBookTickerCopyWithImpl<$Res>
    implements $BinanceBookTickerCopyWith<$Res> {
  _$BinanceBookTickerCopyWithImpl(this._value, this._then);

  final BinanceBookTicker _value;
  // ignore: unused_field
  final $Res Function(BinanceBookTicker) _then;

  @override
  $Res call({
    Object? symbol = freezed,
    Object? bidPrice = freezed,
    Object? bidQty = freezed,
    Object? askPrice = freezed,
    Object? askQty = freezed,
  }) {
    return _then(_value.copyWith(
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      bidPrice: bidPrice == freezed
          ? _value.bidPrice
          : bidPrice // ignore: cast_nullable_to_non_nullable
              as String,
      bidQty: bidQty == freezed
          ? _value.bidQty
          : bidQty // ignore: cast_nullable_to_non_nullable
              as String,
      askPrice: askPrice == freezed
          ? _value.askPrice
          : askPrice // ignore: cast_nullable_to_non_nullable
              as String,
      askQty: askQty == freezed
          ? _value.askQty
          : askQty // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$BinanceBookTickerCopyWith<$Res>
    implements $BinanceBookTickerCopyWith<$Res> {
  factory _$BinanceBookTickerCopyWith(
          _BinanceBookTicker value, $Res Function(_BinanceBookTicker) then) =
      __$BinanceBookTickerCopyWithImpl<$Res>;
  @override
  $Res call(
      {String symbol,
      String bidPrice,
      String bidQty,
      String askPrice,
      String askQty});
}

/// @nodoc
class __$BinanceBookTickerCopyWithImpl<$Res>
    extends _$BinanceBookTickerCopyWithImpl<$Res>
    implements _$BinanceBookTickerCopyWith<$Res> {
  __$BinanceBookTickerCopyWithImpl(
      _BinanceBookTicker _value, $Res Function(_BinanceBookTicker) _then)
      : super(_value, (v) => _then(v as _BinanceBookTicker));

  @override
  _BinanceBookTicker get _value => super._value as _BinanceBookTicker;

  @override
  $Res call({
    Object? symbol = freezed,
    Object? bidPrice = freezed,
    Object? bidQty = freezed,
    Object? askPrice = freezed,
    Object? askQty = freezed,
  }) {
    return _then(_BinanceBookTicker(
      symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      bidPrice == freezed
          ? _value.bidPrice
          : bidPrice // ignore: cast_nullable_to_non_nullable
              as String,
      bidQty == freezed
          ? _value.bidQty
          : bidQty // ignore: cast_nullable_to_non_nullable
              as String,
      askPrice == freezed
          ? _value.askPrice
          : askPrice // ignore: cast_nullable_to_non_nullable
              as String,
      askQty == freezed
          ? _value.askQty
          : askQty // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BinanceBookTicker implements _BinanceBookTicker {
  _$_BinanceBookTicker(
      this.symbol, this.bidPrice, this.bidQty, this.askPrice, this.askQty);

  factory _$_BinanceBookTicker.fromJson(Map<String, dynamic> json) =>
      _$$_BinanceBookTickerFromJson(json);

  @override
  final String symbol;
  @override
  final String bidPrice;
  @override
  final String bidQty;
  @override
  final String askPrice;
  @override
  final String askQty;

  @override
  String toString() {
    return 'BinanceBookTicker(symbol: $symbol, bidPrice: $bidPrice, bidQty: $bidQty, askPrice: $askPrice, askQty: $askQty)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BinanceBookTicker &&
            const DeepCollectionEquality().equals(other.symbol, symbol) &&
            const DeepCollectionEquality().equals(other.bidPrice, bidPrice) &&
            const DeepCollectionEquality().equals(other.bidQty, bidQty) &&
            const DeepCollectionEquality().equals(other.askPrice, askPrice) &&
            const DeepCollectionEquality().equals(other.askQty, askQty));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(symbol),
      const DeepCollectionEquality().hash(bidPrice),
      const DeepCollectionEquality().hash(bidQty),
      const DeepCollectionEquality().hash(askPrice),
      const DeepCollectionEquality().hash(askQty));

  @JsonKey(ignore: true)
  @override
  _$BinanceBookTickerCopyWith<_BinanceBookTicker> get copyWith =>
      __$BinanceBookTickerCopyWithImpl<_BinanceBookTicker>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BinanceBookTickerToJson(this);
  }
}

abstract class _BinanceBookTicker implements BinanceBookTicker {
  factory _BinanceBookTicker(String symbol, String bidPrice, String bidQty,
      String askPrice, String askQty) = _$_BinanceBookTicker;

  factory _BinanceBookTicker.fromJson(Map<String, dynamic> json) =
      _$_BinanceBookTicker.fromJson;

  @override
  String get symbol;
  @override
  String get bidPrice;
  @override
  String get bidQty;
  @override
  String get askPrice;
  @override
  String get askQty;
  @override
  @JsonKey(ignore: true)
  _$BinanceBookTickerCopyWith<_BinanceBookTicker> get copyWith =>
      throw _privateConstructorUsedError;
}
