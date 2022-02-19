// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'average_price.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BinanceAveragePrice _$BinanceAveragePriceFromJson(Map<String, dynamic> json) {
  return _BinanceAveragePrice.fromJson(json);
}

/// @nodoc
class _$BinanceAveragePriceTearOff {
  const _$BinanceAveragePriceTearOff();

  _BinanceAveragePrice call(int mins, String price) {
    return _BinanceAveragePrice(
      mins,
      price,
    );
  }

  BinanceAveragePrice fromJson(Map<String, Object?> json) {
    return BinanceAveragePrice.fromJson(json);
  }
}

/// @nodoc
const $BinanceAveragePrice = _$BinanceAveragePriceTearOff();

/// @nodoc
mixin _$BinanceAveragePrice {
  int get mins => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BinanceAveragePriceCopyWith<BinanceAveragePrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BinanceAveragePriceCopyWith<$Res> {
  factory $BinanceAveragePriceCopyWith(
          BinanceAveragePrice value, $Res Function(BinanceAveragePrice) then) =
      _$BinanceAveragePriceCopyWithImpl<$Res>;
  $Res call({int mins, String price});
}

/// @nodoc
class _$BinanceAveragePriceCopyWithImpl<$Res>
    implements $BinanceAveragePriceCopyWith<$Res> {
  _$BinanceAveragePriceCopyWithImpl(this._value, this._then);

  final BinanceAveragePrice _value;
  // ignore: unused_field
  final $Res Function(BinanceAveragePrice) _then;

  @override
  $Res call({
    Object? mins = freezed,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      mins: mins == freezed
          ? _value.mins
          : mins // ignore: cast_nullable_to_non_nullable
              as int,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$BinanceAveragePriceCopyWith<$Res>
    implements $BinanceAveragePriceCopyWith<$Res> {
  factory _$BinanceAveragePriceCopyWith(_BinanceAveragePrice value,
          $Res Function(_BinanceAveragePrice) then) =
      __$BinanceAveragePriceCopyWithImpl<$Res>;
  @override
  $Res call({int mins, String price});
}

/// @nodoc
class __$BinanceAveragePriceCopyWithImpl<$Res>
    extends _$BinanceAveragePriceCopyWithImpl<$Res>
    implements _$BinanceAveragePriceCopyWith<$Res> {
  __$BinanceAveragePriceCopyWithImpl(
      _BinanceAveragePrice _value, $Res Function(_BinanceAveragePrice) _then)
      : super(_value, (v) => _then(v as _BinanceAveragePrice));

  @override
  _BinanceAveragePrice get _value => super._value as _BinanceAveragePrice;

  @override
  $Res call({
    Object? mins = freezed,
    Object? price = freezed,
  }) {
    return _then(_BinanceAveragePrice(
      mins == freezed
          ? _value.mins
          : mins // ignore: cast_nullable_to_non_nullable
              as int,
      price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BinanceAveragePrice implements _BinanceAveragePrice {
  _$_BinanceAveragePrice(this.mins, this.price);

  factory _$_BinanceAveragePrice.fromJson(Map<String, dynamic> json) =>
      _$$_BinanceAveragePriceFromJson(json);

  @override
  final int mins;
  @override
  final String price;

  @override
  String toString() {
    return 'BinanceAveragePrice(mins: $mins, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BinanceAveragePrice &&
            const DeepCollectionEquality().equals(other.mins, mins) &&
            const DeepCollectionEquality().equals(other.price, price));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(mins),
      const DeepCollectionEquality().hash(price));

  @JsonKey(ignore: true)
  @override
  _$BinanceAveragePriceCopyWith<_BinanceAveragePrice> get copyWith =>
      __$BinanceAveragePriceCopyWithImpl<_BinanceAveragePrice>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BinanceAveragePriceToJson(this);
  }
}

abstract class _BinanceAveragePrice implements BinanceAveragePrice {
  factory _BinanceAveragePrice(int mins, String price) = _$_BinanceAveragePrice;

  factory _BinanceAveragePrice.fromJson(Map<String, dynamic> json) =
      _$_BinanceAveragePrice.fromJson;

  @override
  int get mins;
  @override
  String get price;
  @override
  @JsonKey(ignore: true)
  _$BinanceAveragePriceCopyWith<_BinanceAveragePrice> get copyWith =>
      throw _privateConstructorUsedError;
}
