// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BinanceOrderBook _$BinanceOrderBookFromJson(Map<String, dynamic> json) {
  return _BinanceOrderBook.fromJson(json);
}

/// @nodoc
class _$BinanceOrderBookTearOff {
  const _$BinanceOrderBookTearOff();

  _BinanceOrderBook call(
      int lastUpdateId, List<List<String>> bids, List<List<String>> asks) {
    return _BinanceOrderBook(
      lastUpdateId,
      bids,
      asks,
    );
  }

  BinanceOrderBook fromJson(Map<String, Object?> json) {
    return BinanceOrderBook.fromJson(json);
  }
}

/// @nodoc
const $BinanceOrderBook = _$BinanceOrderBookTearOff();

/// @nodoc
mixin _$BinanceOrderBook {
  int get lastUpdateId => throw _privateConstructorUsedError;
  List<List<String>> get bids => throw _privateConstructorUsedError;
  List<List<String>> get asks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BinanceOrderBookCopyWith<BinanceOrderBook> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BinanceOrderBookCopyWith<$Res> {
  factory $BinanceOrderBookCopyWith(
          BinanceOrderBook value, $Res Function(BinanceOrderBook) then) =
      _$BinanceOrderBookCopyWithImpl<$Res>;
  $Res call(
      {int lastUpdateId, List<List<String>> bids, List<List<String>> asks});
}

/// @nodoc
class _$BinanceOrderBookCopyWithImpl<$Res>
    implements $BinanceOrderBookCopyWith<$Res> {
  _$BinanceOrderBookCopyWithImpl(this._value, this._then);

  final BinanceOrderBook _value;
  // ignore: unused_field
  final $Res Function(BinanceOrderBook) _then;

  @override
  $Res call({
    Object? lastUpdateId = freezed,
    Object? bids = freezed,
    Object? asks = freezed,
  }) {
    return _then(_value.copyWith(
      lastUpdateId: lastUpdateId == freezed
          ? _value.lastUpdateId
          : lastUpdateId // ignore: cast_nullable_to_non_nullable
              as int,
      bids: bids == freezed
          ? _value.bids
          : bids // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
      asks: asks == freezed
          ? _value.asks
          : asks // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
    ));
  }
}

/// @nodoc
abstract class _$BinanceOrderBookCopyWith<$Res>
    implements $BinanceOrderBookCopyWith<$Res> {
  factory _$BinanceOrderBookCopyWith(
          _BinanceOrderBook value, $Res Function(_BinanceOrderBook) then) =
      __$BinanceOrderBookCopyWithImpl<$Res>;
  @override
  $Res call(
      {int lastUpdateId, List<List<String>> bids, List<List<String>> asks});
}

/// @nodoc
class __$BinanceOrderBookCopyWithImpl<$Res>
    extends _$BinanceOrderBookCopyWithImpl<$Res>
    implements _$BinanceOrderBookCopyWith<$Res> {
  __$BinanceOrderBookCopyWithImpl(
      _BinanceOrderBook _value, $Res Function(_BinanceOrderBook) _then)
      : super(_value, (v) => _then(v as _BinanceOrderBook));

  @override
  _BinanceOrderBook get _value => super._value as _BinanceOrderBook;

  @override
  $Res call({
    Object? lastUpdateId = freezed,
    Object? bids = freezed,
    Object? asks = freezed,
  }) {
    return _then(_BinanceOrderBook(
      lastUpdateId == freezed
          ? _value.lastUpdateId
          : lastUpdateId // ignore: cast_nullable_to_non_nullable
              as int,
      bids == freezed
          ? _value.bids
          : bids // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
      asks == freezed
          ? _value.asks
          : asks // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BinanceOrderBook implements _BinanceOrderBook {
  _$_BinanceOrderBook(this.lastUpdateId, this.bids, this.asks);

  factory _$_BinanceOrderBook.fromJson(Map<String, dynamic> json) =>
      _$$_BinanceOrderBookFromJson(json);

  @override
  final int lastUpdateId;
  @override
  final List<List<String>> bids;
  @override
  final List<List<String>> asks;

  @override
  String toString() {
    return 'BinanceOrderBook(lastUpdateId: $lastUpdateId, bids: $bids, asks: $asks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BinanceOrderBook &&
            const DeepCollectionEquality()
                .equals(other.lastUpdateId, lastUpdateId) &&
            const DeepCollectionEquality().equals(other.bids, bids) &&
            const DeepCollectionEquality().equals(other.asks, asks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(lastUpdateId),
      const DeepCollectionEquality().hash(bids),
      const DeepCollectionEquality().hash(asks));

  @JsonKey(ignore: true)
  @override
  _$BinanceOrderBookCopyWith<_BinanceOrderBook> get copyWith =>
      __$BinanceOrderBookCopyWithImpl<_BinanceOrderBook>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BinanceOrderBookToJson(this);
  }
}

abstract class _BinanceOrderBook implements BinanceOrderBook {
  factory _BinanceOrderBook(
          int lastUpdateId, List<List<String>> bids, List<List<String>> asks) =
      _$_BinanceOrderBook;

  factory _BinanceOrderBook.fromJson(Map<String, dynamic> json) =
      _$_BinanceOrderBook.fromJson;

  @override
  int get lastUpdateId;
  @override
  List<List<String>> get bids;
  @override
  List<List<String>> get asks;
  @override
  @JsonKey(ignore: true)
  _$BinanceOrderBookCopyWith<_BinanceOrderBook> get copyWith =>
      throw _privateConstructorUsedError;
}
