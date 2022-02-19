// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_fill.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BinanceOrderFill _$BinanceOrderFillFromJson(Map<String, dynamic> json) {
  return _BinanceOrderFill.fromJson(json);
}

/// @nodoc
class _$BinanceOrderFillTearOff {
  const _$BinanceOrderFillTearOff();

  _BinanceOrderFill call(String price, String qty, String commission,
      String commissionAsset, int tradeId) {
    return _BinanceOrderFill(
      price,
      qty,
      commission,
      commissionAsset,
      tradeId,
    );
  }

  BinanceOrderFill fromJson(Map<String, Object?> json) {
    return BinanceOrderFill.fromJson(json);
  }
}

/// @nodoc
const $BinanceOrderFill = _$BinanceOrderFillTearOff();

/// @nodoc
mixin _$BinanceOrderFill {
  String get price => throw _privateConstructorUsedError;
  String get qty => throw _privateConstructorUsedError;
  String get commission => throw _privateConstructorUsedError;
  String get commissionAsset => throw _privateConstructorUsedError;
  int get tradeId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BinanceOrderFillCopyWith<BinanceOrderFill> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BinanceOrderFillCopyWith<$Res> {
  factory $BinanceOrderFillCopyWith(
          BinanceOrderFill value, $Res Function(BinanceOrderFill) then) =
      _$BinanceOrderFillCopyWithImpl<$Res>;
  $Res call(
      {String price,
      String qty,
      String commission,
      String commissionAsset,
      int tradeId});
}

/// @nodoc
class _$BinanceOrderFillCopyWithImpl<$Res>
    implements $BinanceOrderFillCopyWith<$Res> {
  _$BinanceOrderFillCopyWithImpl(this._value, this._then);

  final BinanceOrderFill _value;
  // ignore: unused_field
  final $Res Function(BinanceOrderFill) _then;

  @override
  $Res call({
    Object? price = freezed,
    Object? qty = freezed,
    Object? commission = freezed,
    Object? commissionAsset = freezed,
    Object? tradeId = freezed,
  }) {
    return _then(_value.copyWith(
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      qty: qty == freezed
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as String,
      commission: commission == freezed
          ? _value.commission
          : commission // ignore: cast_nullable_to_non_nullable
              as String,
      commissionAsset: commissionAsset == freezed
          ? _value.commissionAsset
          : commissionAsset // ignore: cast_nullable_to_non_nullable
              as String,
      tradeId: tradeId == freezed
          ? _value.tradeId
          : tradeId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$BinanceOrderFillCopyWith<$Res>
    implements $BinanceOrderFillCopyWith<$Res> {
  factory _$BinanceOrderFillCopyWith(
          _BinanceOrderFill value, $Res Function(_BinanceOrderFill) then) =
      __$BinanceOrderFillCopyWithImpl<$Res>;
  @override
  $Res call(
      {String price,
      String qty,
      String commission,
      String commissionAsset,
      int tradeId});
}

/// @nodoc
class __$BinanceOrderFillCopyWithImpl<$Res>
    extends _$BinanceOrderFillCopyWithImpl<$Res>
    implements _$BinanceOrderFillCopyWith<$Res> {
  __$BinanceOrderFillCopyWithImpl(
      _BinanceOrderFill _value, $Res Function(_BinanceOrderFill) _then)
      : super(_value, (v) => _then(v as _BinanceOrderFill));

  @override
  _BinanceOrderFill get _value => super._value as _BinanceOrderFill;

  @override
  $Res call({
    Object? price = freezed,
    Object? qty = freezed,
    Object? commission = freezed,
    Object? commissionAsset = freezed,
    Object? tradeId = freezed,
  }) {
    return _then(_BinanceOrderFill(
      price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      qty == freezed
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as String,
      commission == freezed
          ? _value.commission
          : commission // ignore: cast_nullable_to_non_nullable
              as String,
      commissionAsset == freezed
          ? _value.commissionAsset
          : commissionAsset // ignore: cast_nullable_to_non_nullable
              as String,
      tradeId == freezed
          ? _value.tradeId
          : tradeId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BinanceOrderFill implements _BinanceOrderFill {
  _$_BinanceOrderFill(this.price, this.qty, this.commission,
      this.commissionAsset, this.tradeId);

  factory _$_BinanceOrderFill.fromJson(Map<String, dynamic> json) =>
      _$$_BinanceOrderFillFromJson(json);

  @override
  final String price;
  @override
  final String qty;
  @override
  final String commission;
  @override
  final String commissionAsset;
  @override
  final int tradeId;

  @override
  String toString() {
    return 'BinanceOrderFill(price: $price, qty: $qty, commission: $commission, commissionAsset: $commissionAsset, tradeId: $tradeId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BinanceOrderFill &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.qty, qty) &&
            const DeepCollectionEquality()
                .equals(other.commission, commission) &&
            const DeepCollectionEquality()
                .equals(other.commissionAsset, commissionAsset) &&
            const DeepCollectionEquality().equals(other.tradeId, tradeId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(qty),
      const DeepCollectionEquality().hash(commission),
      const DeepCollectionEquality().hash(commissionAsset),
      const DeepCollectionEquality().hash(tradeId));

  @JsonKey(ignore: true)
  @override
  _$BinanceOrderFillCopyWith<_BinanceOrderFill> get copyWith =>
      __$BinanceOrderFillCopyWithImpl<_BinanceOrderFill>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BinanceOrderFillToJson(this);
  }
}

abstract class _BinanceOrderFill implements BinanceOrderFill {
  factory _BinanceOrderFill(String price, String qty, String commission,
      String commissionAsset, int tradeId) = _$_BinanceOrderFill;

  factory _BinanceOrderFill.fromJson(Map<String, dynamic> json) =
      _$_BinanceOrderFill.fromJson;

  @override
  String get price;
  @override
  String get qty;
  @override
  String get commission;
  @override
  String get commissionAsset;
  @override
  int get tradeId;
  @override
  @JsonKey(ignore: true)
  _$BinanceOrderFillCopyWith<_BinanceOrderFill> get copyWith =>
      throw _privateConstructorUsedError;
}
