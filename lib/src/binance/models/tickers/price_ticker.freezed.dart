// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'price_ticker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BinancePriceTicker _$BinancePriceTickerFromJson(Map<String, dynamic> json) {
  return _BinancePriceTicker.fromJson(json);
}

/// @nodoc
class _$BinancePriceTickerTearOff {
  const _$BinancePriceTickerTearOff();

  _BinancePriceTicker call(String symbol, String price) {
    return _BinancePriceTicker(
      symbol,
      price,
    );
  }

  BinancePriceTicker fromJson(Map<String, Object?> json) {
    return BinancePriceTicker.fromJson(json);
  }
}

/// @nodoc
const $BinancePriceTicker = _$BinancePriceTickerTearOff();

/// @nodoc
mixin _$BinancePriceTicker {
  String get symbol => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BinancePriceTickerCopyWith<BinancePriceTicker> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BinancePriceTickerCopyWith<$Res> {
  factory $BinancePriceTickerCopyWith(
          BinancePriceTicker value, $Res Function(BinancePriceTicker) then) =
      _$BinancePriceTickerCopyWithImpl<$Res>;
  $Res call({String symbol, String price});
}

/// @nodoc
class _$BinancePriceTickerCopyWithImpl<$Res>
    implements $BinancePriceTickerCopyWith<$Res> {
  _$BinancePriceTickerCopyWithImpl(this._value, this._then);

  final BinancePriceTicker _value;
  // ignore: unused_field
  final $Res Function(BinancePriceTicker) _then;

  @override
  $Res call({
    Object? symbol = freezed,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$BinancePriceTickerCopyWith<$Res>
    implements $BinancePriceTickerCopyWith<$Res> {
  factory _$BinancePriceTickerCopyWith(
          _BinancePriceTicker value, $Res Function(_BinancePriceTicker) then) =
      __$BinancePriceTickerCopyWithImpl<$Res>;
  @override
  $Res call({String symbol, String price});
}

/// @nodoc
class __$BinancePriceTickerCopyWithImpl<$Res>
    extends _$BinancePriceTickerCopyWithImpl<$Res>
    implements _$BinancePriceTickerCopyWith<$Res> {
  __$BinancePriceTickerCopyWithImpl(
      _BinancePriceTicker _value, $Res Function(_BinancePriceTicker) _then)
      : super(_value, (v) => _then(v as _BinancePriceTicker));

  @override
  _BinancePriceTicker get _value => super._value as _BinancePriceTicker;

  @override
  $Res call({
    Object? symbol = freezed,
    Object? price = freezed,
  }) {
    return _then(_BinancePriceTicker(
      symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BinancePriceTicker implements _BinancePriceTicker {
  _$_BinancePriceTicker(this.symbol, this.price);

  factory _$_BinancePriceTicker.fromJson(Map<String, dynamic> json) =>
      _$$_BinancePriceTickerFromJson(json);

  @override
  final String symbol;
  @override
  final String price;

  @override
  String toString() {
    return 'BinancePriceTicker(symbol: $symbol, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BinancePriceTicker &&
            const DeepCollectionEquality().equals(other.symbol, symbol) &&
            const DeepCollectionEquality().equals(other.price, price));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(symbol),
      const DeepCollectionEquality().hash(price));

  @JsonKey(ignore: true)
  @override
  _$BinancePriceTickerCopyWith<_BinancePriceTicker> get copyWith =>
      __$BinancePriceTickerCopyWithImpl<_BinancePriceTicker>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BinancePriceTickerToJson(this);
  }
}

abstract class _BinancePriceTicker implements BinancePriceTicker {
  factory _BinancePriceTicker(String symbol, String price) =
      _$_BinancePriceTicker;

  factory _BinancePriceTicker.fromJson(Map<String, dynamic> json) =
      _$_BinancePriceTicker.fromJson;

  @override
  String get symbol;
  @override
  String get price;
  @override
  @JsonKey(ignore: true)
  _$BinancePriceTickerCopyWith<_BinancePriceTicker> get copyWith =>
      throw _privateConstructorUsedError;
}
