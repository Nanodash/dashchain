// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'symbol.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BinanceSymbol _$BinanceSymbolFromJson(Map<String, dynamic> json) {
  return _BinanceSymbol.fromJson(json);
}

/// @nodoc
class _$BinanceSymbolTearOff {
  const _$BinanceSymbolTearOff();

  _BinanceSymbol call(
      String symbol,
      String status,
      String baseAsset,
      int baseAssetPrecision,
      String quoteAsset,
      int quotePrecision,
      int quoteAssetPrecision,
      int baseCommissionPrecision,
      int quoteCommissionPrecision,
      List<String> orderTypes,
      bool icebergAllowed,
      bool ocoAllowed,
      bool quoteOrderQtyMarketAllowed,
      bool isSpotTradingAllowed,
      bool isMarginTradingAllowed,
      List<Map<String, dynamic>> filters,
      List<String> permissions) {
    return _BinanceSymbol(
      symbol,
      status,
      baseAsset,
      baseAssetPrecision,
      quoteAsset,
      quotePrecision,
      quoteAssetPrecision,
      baseCommissionPrecision,
      quoteCommissionPrecision,
      orderTypes,
      icebergAllowed,
      ocoAllowed,
      quoteOrderQtyMarketAllowed,
      isSpotTradingAllowed,
      isMarginTradingAllowed,
      filters,
      permissions,
    );
  }

  BinanceSymbol fromJson(Map<String, Object?> json) {
    return BinanceSymbol.fromJson(json);
  }
}

/// @nodoc
const $BinanceSymbol = _$BinanceSymbolTearOff();

/// @nodoc
mixin _$BinanceSymbol {
  String get symbol => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get baseAsset => throw _privateConstructorUsedError;
  int get baseAssetPrecision => throw _privateConstructorUsedError;
  String get quoteAsset => throw _privateConstructorUsedError;
  int get quotePrecision => throw _privateConstructorUsedError;
  int get quoteAssetPrecision => throw _privateConstructorUsedError;
  int get baseCommissionPrecision => throw _privateConstructorUsedError;
  int get quoteCommissionPrecision => throw _privateConstructorUsedError;
  List<String> get orderTypes => throw _privateConstructorUsedError;
  bool get icebergAllowed => throw _privateConstructorUsedError;
  bool get ocoAllowed => throw _privateConstructorUsedError;
  bool get quoteOrderQtyMarketAllowed => throw _privateConstructorUsedError;
  bool get isSpotTradingAllowed => throw _privateConstructorUsedError;
  bool get isMarginTradingAllowed => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get filters => throw _privateConstructorUsedError;
  List<String> get permissions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BinanceSymbolCopyWith<BinanceSymbol> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BinanceSymbolCopyWith<$Res> {
  factory $BinanceSymbolCopyWith(
          BinanceSymbol value, $Res Function(BinanceSymbol) then) =
      _$BinanceSymbolCopyWithImpl<$Res>;
  $Res call(
      {String symbol,
      String status,
      String baseAsset,
      int baseAssetPrecision,
      String quoteAsset,
      int quotePrecision,
      int quoteAssetPrecision,
      int baseCommissionPrecision,
      int quoteCommissionPrecision,
      List<String> orderTypes,
      bool icebergAllowed,
      bool ocoAllowed,
      bool quoteOrderQtyMarketAllowed,
      bool isSpotTradingAllowed,
      bool isMarginTradingAllowed,
      List<Map<String, dynamic>> filters,
      List<String> permissions});
}

/// @nodoc
class _$BinanceSymbolCopyWithImpl<$Res>
    implements $BinanceSymbolCopyWith<$Res> {
  _$BinanceSymbolCopyWithImpl(this._value, this._then);

  final BinanceSymbol _value;
  // ignore: unused_field
  final $Res Function(BinanceSymbol) _then;

  @override
  $Res call({
    Object? symbol = freezed,
    Object? status = freezed,
    Object? baseAsset = freezed,
    Object? baseAssetPrecision = freezed,
    Object? quoteAsset = freezed,
    Object? quotePrecision = freezed,
    Object? quoteAssetPrecision = freezed,
    Object? baseCommissionPrecision = freezed,
    Object? quoteCommissionPrecision = freezed,
    Object? orderTypes = freezed,
    Object? icebergAllowed = freezed,
    Object? ocoAllowed = freezed,
    Object? quoteOrderQtyMarketAllowed = freezed,
    Object? isSpotTradingAllowed = freezed,
    Object? isMarginTradingAllowed = freezed,
    Object? filters = freezed,
    Object? permissions = freezed,
  }) {
    return _then(_value.copyWith(
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      baseAsset: baseAsset == freezed
          ? _value.baseAsset
          : baseAsset // ignore: cast_nullable_to_non_nullable
              as String,
      baseAssetPrecision: baseAssetPrecision == freezed
          ? _value.baseAssetPrecision
          : baseAssetPrecision // ignore: cast_nullable_to_non_nullable
              as int,
      quoteAsset: quoteAsset == freezed
          ? _value.quoteAsset
          : quoteAsset // ignore: cast_nullable_to_non_nullable
              as String,
      quotePrecision: quotePrecision == freezed
          ? _value.quotePrecision
          : quotePrecision // ignore: cast_nullable_to_non_nullable
              as int,
      quoteAssetPrecision: quoteAssetPrecision == freezed
          ? _value.quoteAssetPrecision
          : quoteAssetPrecision // ignore: cast_nullable_to_non_nullable
              as int,
      baseCommissionPrecision: baseCommissionPrecision == freezed
          ? _value.baseCommissionPrecision
          : baseCommissionPrecision // ignore: cast_nullable_to_non_nullable
              as int,
      quoteCommissionPrecision: quoteCommissionPrecision == freezed
          ? _value.quoteCommissionPrecision
          : quoteCommissionPrecision // ignore: cast_nullable_to_non_nullable
              as int,
      orderTypes: orderTypes == freezed
          ? _value.orderTypes
          : orderTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      icebergAllowed: icebergAllowed == freezed
          ? _value.icebergAllowed
          : icebergAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
      ocoAllowed: ocoAllowed == freezed
          ? _value.ocoAllowed
          : ocoAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
      quoteOrderQtyMarketAllowed: quoteOrderQtyMarketAllowed == freezed
          ? _value.quoteOrderQtyMarketAllowed
          : quoteOrderQtyMarketAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
      isSpotTradingAllowed: isSpotTradingAllowed == freezed
          ? _value.isSpotTradingAllowed
          : isSpotTradingAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
      isMarginTradingAllowed: isMarginTradingAllowed == freezed
          ? _value.isMarginTradingAllowed
          : isMarginTradingAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
      filters: filters == freezed
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      permissions: permissions == freezed
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$BinanceSymbolCopyWith<$Res>
    implements $BinanceSymbolCopyWith<$Res> {
  factory _$BinanceSymbolCopyWith(
          _BinanceSymbol value, $Res Function(_BinanceSymbol) then) =
      __$BinanceSymbolCopyWithImpl<$Res>;
  @override
  $Res call(
      {String symbol,
      String status,
      String baseAsset,
      int baseAssetPrecision,
      String quoteAsset,
      int quotePrecision,
      int quoteAssetPrecision,
      int baseCommissionPrecision,
      int quoteCommissionPrecision,
      List<String> orderTypes,
      bool icebergAllowed,
      bool ocoAllowed,
      bool quoteOrderQtyMarketAllowed,
      bool isSpotTradingAllowed,
      bool isMarginTradingAllowed,
      List<Map<String, dynamic>> filters,
      List<String> permissions});
}

/// @nodoc
class __$BinanceSymbolCopyWithImpl<$Res>
    extends _$BinanceSymbolCopyWithImpl<$Res>
    implements _$BinanceSymbolCopyWith<$Res> {
  __$BinanceSymbolCopyWithImpl(
      _BinanceSymbol _value, $Res Function(_BinanceSymbol) _then)
      : super(_value, (v) => _then(v as _BinanceSymbol));

  @override
  _BinanceSymbol get _value => super._value as _BinanceSymbol;

  @override
  $Res call({
    Object? symbol = freezed,
    Object? status = freezed,
    Object? baseAsset = freezed,
    Object? baseAssetPrecision = freezed,
    Object? quoteAsset = freezed,
    Object? quotePrecision = freezed,
    Object? quoteAssetPrecision = freezed,
    Object? baseCommissionPrecision = freezed,
    Object? quoteCommissionPrecision = freezed,
    Object? orderTypes = freezed,
    Object? icebergAllowed = freezed,
    Object? ocoAllowed = freezed,
    Object? quoteOrderQtyMarketAllowed = freezed,
    Object? isSpotTradingAllowed = freezed,
    Object? isMarginTradingAllowed = freezed,
    Object? filters = freezed,
    Object? permissions = freezed,
  }) {
    return _then(_BinanceSymbol(
      symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      baseAsset == freezed
          ? _value.baseAsset
          : baseAsset // ignore: cast_nullable_to_non_nullable
              as String,
      baseAssetPrecision == freezed
          ? _value.baseAssetPrecision
          : baseAssetPrecision // ignore: cast_nullable_to_non_nullable
              as int,
      quoteAsset == freezed
          ? _value.quoteAsset
          : quoteAsset // ignore: cast_nullable_to_non_nullable
              as String,
      quotePrecision == freezed
          ? _value.quotePrecision
          : quotePrecision // ignore: cast_nullable_to_non_nullable
              as int,
      quoteAssetPrecision == freezed
          ? _value.quoteAssetPrecision
          : quoteAssetPrecision // ignore: cast_nullable_to_non_nullable
              as int,
      baseCommissionPrecision == freezed
          ? _value.baseCommissionPrecision
          : baseCommissionPrecision // ignore: cast_nullable_to_non_nullable
              as int,
      quoteCommissionPrecision == freezed
          ? _value.quoteCommissionPrecision
          : quoteCommissionPrecision // ignore: cast_nullable_to_non_nullable
              as int,
      orderTypes == freezed
          ? _value.orderTypes
          : orderTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      icebergAllowed == freezed
          ? _value.icebergAllowed
          : icebergAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
      ocoAllowed == freezed
          ? _value.ocoAllowed
          : ocoAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
      quoteOrderQtyMarketAllowed == freezed
          ? _value.quoteOrderQtyMarketAllowed
          : quoteOrderQtyMarketAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
      isSpotTradingAllowed == freezed
          ? _value.isSpotTradingAllowed
          : isSpotTradingAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
      isMarginTradingAllowed == freezed
          ? _value.isMarginTradingAllowed
          : isMarginTradingAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
      filters == freezed
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      permissions == freezed
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BinanceSymbol implements _BinanceSymbol {
  _$_BinanceSymbol(
      this.symbol,
      this.status,
      this.baseAsset,
      this.baseAssetPrecision,
      this.quoteAsset,
      this.quotePrecision,
      this.quoteAssetPrecision,
      this.baseCommissionPrecision,
      this.quoteCommissionPrecision,
      this.orderTypes,
      this.icebergAllowed,
      this.ocoAllowed,
      this.quoteOrderQtyMarketAllowed,
      this.isSpotTradingAllowed,
      this.isMarginTradingAllowed,
      this.filters,
      this.permissions);

  factory _$_BinanceSymbol.fromJson(Map<String, dynamic> json) =>
      _$$_BinanceSymbolFromJson(json);

  @override
  final String symbol;
  @override
  final String status;
  @override
  final String baseAsset;
  @override
  final int baseAssetPrecision;
  @override
  final String quoteAsset;
  @override
  final int quotePrecision;
  @override
  final int quoteAssetPrecision;
  @override
  final int baseCommissionPrecision;
  @override
  final int quoteCommissionPrecision;
  @override
  final List<String> orderTypes;
  @override
  final bool icebergAllowed;
  @override
  final bool ocoAllowed;
  @override
  final bool quoteOrderQtyMarketAllowed;
  @override
  final bool isSpotTradingAllowed;
  @override
  final bool isMarginTradingAllowed;
  @override
  final List<Map<String, dynamic>> filters;
  @override
  final List<String> permissions;

  @override
  String toString() {
    return 'BinanceSymbol(symbol: $symbol, status: $status, baseAsset: $baseAsset, baseAssetPrecision: $baseAssetPrecision, quoteAsset: $quoteAsset, quotePrecision: $quotePrecision, quoteAssetPrecision: $quoteAssetPrecision, baseCommissionPrecision: $baseCommissionPrecision, quoteCommissionPrecision: $quoteCommissionPrecision, orderTypes: $orderTypes, icebergAllowed: $icebergAllowed, ocoAllowed: $ocoAllowed, quoteOrderQtyMarketAllowed: $quoteOrderQtyMarketAllowed, isSpotTradingAllowed: $isSpotTradingAllowed, isMarginTradingAllowed: $isMarginTradingAllowed, filters: $filters, permissions: $permissions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BinanceSymbol &&
            const DeepCollectionEquality().equals(other.symbol, symbol) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.baseAsset, baseAsset) &&
            const DeepCollectionEquality()
                .equals(other.baseAssetPrecision, baseAssetPrecision) &&
            const DeepCollectionEquality()
                .equals(other.quoteAsset, quoteAsset) &&
            const DeepCollectionEquality()
                .equals(other.quotePrecision, quotePrecision) &&
            const DeepCollectionEquality()
                .equals(other.quoteAssetPrecision, quoteAssetPrecision) &&
            const DeepCollectionEquality().equals(
                other.baseCommissionPrecision, baseCommissionPrecision) &&
            const DeepCollectionEquality().equals(
                other.quoteCommissionPrecision, quoteCommissionPrecision) &&
            const DeepCollectionEquality()
                .equals(other.orderTypes, orderTypes) &&
            const DeepCollectionEquality()
                .equals(other.icebergAllowed, icebergAllowed) &&
            const DeepCollectionEquality()
                .equals(other.ocoAllowed, ocoAllowed) &&
            const DeepCollectionEquality().equals(
                other.quoteOrderQtyMarketAllowed, quoteOrderQtyMarketAllowed) &&
            const DeepCollectionEquality()
                .equals(other.isSpotTradingAllowed, isSpotTradingAllowed) &&
            const DeepCollectionEquality()
                .equals(other.isMarginTradingAllowed, isMarginTradingAllowed) &&
            const DeepCollectionEquality().equals(other.filters, filters) &&
            const DeepCollectionEquality()
                .equals(other.permissions, permissions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(symbol),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(baseAsset),
      const DeepCollectionEquality().hash(baseAssetPrecision),
      const DeepCollectionEquality().hash(quoteAsset),
      const DeepCollectionEquality().hash(quotePrecision),
      const DeepCollectionEquality().hash(quoteAssetPrecision),
      const DeepCollectionEquality().hash(baseCommissionPrecision),
      const DeepCollectionEquality().hash(quoteCommissionPrecision),
      const DeepCollectionEquality().hash(orderTypes),
      const DeepCollectionEquality().hash(icebergAllowed),
      const DeepCollectionEquality().hash(ocoAllowed),
      const DeepCollectionEquality().hash(quoteOrderQtyMarketAllowed),
      const DeepCollectionEquality().hash(isSpotTradingAllowed),
      const DeepCollectionEquality().hash(isMarginTradingAllowed),
      const DeepCollectionEquality().hash(filters),
      const DeepCollectionEquality().hash(permissions));

  @JsonKey(ignore: true)
  @override
  _$BinanceSymbolCopyWith<_BinanceSymbol> get copyWith =>
      __$BinanceSymbolCopyWithImpl<_BinanceSymbol>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BinanceSymbolToJson(this);
  }
}

abstract class _BinanceSymbol implements BinanceSymbol {
  factory _BinanceSymbol(
      String symbol,
      String status,
      String baseAsset,
      int baseAssetPrecision,
      String quoteAsset,
      int quotePrecision,
      int quoteAssetPrecision,
      int baseCommissionPrecision,
      int quoteCommissionPrecision,
      List<String> orderTypes,
      bool icebergAllowed,
      bool ocoAllowed,
      bool quoteOrderQtyMarketAllowed,
      bool isSpotTradingAllowed,
      bool isMarginTradingAllowed,
      List<Map<String, dynamic>> filters,
      List<String> permissions) = _$_BinanceSymbol;

  factory _BinanceSymbol.fromJson(Map<String, dynamic> json) =
      _$_BinanceSymbol.fromJson;

  @override
  String get symbol;
  @override
  String get status;
  @override
  String get baseAsset;
  @override
  int get baseAssetPrecision;
  @override
  String get quoteAsset;
  @override
  int get quotePrecision;
  @override
  int get quoteAssetPrecision;
  @override
  int get baseCommissionPrecision;
  @override
  int get quoteCommissionPrecision;
  @override
  List<String> get orderTypes;
  @override
  bool get icebergAllowed;
  @override
  bool get ocoAllowed;
  @override
  bool get quoteOrderQtyMarketAllowed;
  @override
  bool get isSpotTradingAllowed;
  @override
  bool get isMarginTradingAllowed;
  @override
  List<Map<String, dynamic>> get filters;
  @override
  List<String> get permissions;
  @override
  @JsonKey(ignore: true)
  _$BinanceSymbolCopyWith<_BinanceSymbol> get copyWith =>
      throw _privateConstructorUsedError;
}
