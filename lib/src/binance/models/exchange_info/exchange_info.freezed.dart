// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'exchange_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BinanceExchangeInfo _$BinanceExchangeInfoFromJson(Map<String, dynamic> json) {
  return _BinanceExchangeInfo.fromJson(json);
}

/// @nodoc
class _$BinanceExchangeInfoTearOff {
  const _$BinanceExchangeInfoTearOff();

  _BinanceExchangeInfo call(
      String timezone,
      int serverTime,
      List<BinanceRateLimiter> rateLimits,
      List<BinanceExchangeFilter> exchangeFilters,
      List<BinanceSymbol> symbols) {
    return _BinanceExchangeInfo(
      timezone,
      serverTime,
      rateLimits,
      exchangeFilters,
      symbols,
    );
  }

  BinanceExchangeInfo fromJson(Map<String, Object?> json) {
    return BinanceExchangeInfo.fromJson(json);
  }
}

/// @nodoc
const $BinanceExchangeInfo = _$BinanceExchangeInfoTearOff();

/// @nodoc
mixin _$BinanceExchangeInfo {
  String get timezone => throw _privateConstructorUsedError;
  int get serverTime => throw _privateConstructorUsedError;
  List<BinanceRateLimiter> get rateLimits => throw _privateConstructorUsedError;
  List<BinanceExchangeFilter> get exchangeFilters =>
      throw _privateConstructorUsedError;
  List<BinanceSymbol> get symbols => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BinanceExchangeInfoCopyWith<BinanceExchangeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BinanceExchangeInfoCopyWith<$Res> {
  factory $BinanceExchangeInfoCopyWith(
          BinanceExchangeInfo value, $Res Function(BinanceExchangeInfo) then) =
      _$BinanceExchangeInfoCopyWithImpl<$Res>;
  $Res call(
      {String timezone,
      int serverTime,
      List<BinanceRateLimiter> rateLimits,
      List<BinanceExchangeFilter> exchangeFilters,
      List<BinanceSymbol> symbols});
}

/// @nodoc
class _$BinanceExchangeInfoCopyWithImpl<$Res>
    implements $BinanceExchangeInfoCopyWith<$Res> {
  _$BinanceExchangeInfoCopyWithImpl(this._value, this._then);

  final BinanceExchangeInfo _value;
  // ignore: unused_field
  final $Res Function(BinanceExchangeInfo) _then;

  @override
  $Res call({
    Object? timezone = freezed,
    Object? serverTime = freezed,
    Object? rateLimits = freezed,
    Object? exchangeFilters = freezed,
    Object? symbols = freezed,
  }) {
    return _then(_value.copyWith(
      timezone: timezone == freezed
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
      serverTime: serverTime == freezed
          ? _value.serverTime
          : serverTime // ignore: cast_nullable_to_non_nullable
              as int,
      rateLimits: rateLimits == freezed
          ? _value.rateLimits
          : rateLimits // ignore: cast_nullable_to_non_nullable
              as List<BinanceRateLimiter>,
      exchangeFilters: exchangeFilters == freezed
          ? _value.exchangeFilters
          : exchangeFilters // ignore: cast_nullable_to_non_nullable
              as List<BinanceExchangeFilter>,
      symbols: symbols == freezed
          ? _value.symbols
          : symbols // ignore: cast_nullable_to_non_nullable
              as List<BinanceSymbol>,
    ));
  }
}

/// @nodoc
abstract class _$BinanceExchangeInfoCopyWith<$Res>
    implements $BinanceExchangeInfoCopyWith<$Res> {
  factory _$BinanceExchangeInfoCopyWith(_BinanceExchangeInfo value,
          $Res Function(_BinanceExchangeInfo) then) =
      __$BinanceExchangeInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String timezone,
      int serverTime,
      List<BinanceRateLimiter> rateLimits,
      List<BinanceExchangeFilter> exchangeFilters,
      List<BinanceSymbol> symbols});
}

/// @nodoc
class __$BinanceExchangeInfoCopyWithImpl<$Res>
    extends _$BinanceExchangeInfoCopyWithImpl<$Res>
    implements _$BinanceExchangeInfoCopyWith<$Res> {
  __$BinanceExchangeInfoCopyWithImpl(
      _BinanceExchangeInfo _value, $Res Function(_BinanceExchangeInfo) _then)
      : super(_value, (v) => _then(v as _BinanceExchangeInfo));

  @override
  _BinanceExchangeInfo get _value => super._value as _BinanceExchangeInfo;

  @override
  $Res call({
    Object? timezone = freezed,
    Object? serverTime = freezed,
    Object? rateLimits = freezed,
    Object? exchangeFilters = freezed,
    Object? symbols = freezed,
  }) {
    return _then(_BinanceExchangeInfo(
      timezone == freezed
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
      serverTime == freezed
          ? _value.serverTime
          : serverTime // ignore: cast_nullable_to_non_nullable
              as int,
      rateLimits == freezed
          ? _value.rateLimits
          : rateLimits // ignore: cast_nullable_to_non_nullable
              as List<BinanceRateLimiter>,
      exchangeFilters == freezed
          ? _value.exchangeFilters
          : exchangeFilters // ignore: cast_nullable_to_non_nullable
              as List<BinanceExchangeFilter>,
      symbols == freezed
          ? _value.symbols
          : symbols // ignore: cast_nullable_to_non_nullable
              as List<BinanceSymbol>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BinanceExchangeInfo implements _BinanceExchangeInfo {
  _$_BinanceExchangeInfo(this.timezone, this.serverTime, this.rateLimits,
      this.exchangeFilters, this.symbols);

  factory _$_BinanceExchangeInfo.fromJson(Map<String, dynamic> json) =>
      _$$_BinanceExchangeInfoFromJson(json);

  @override
  final String timezone;
  @override
  final int serverTime;
  @override
  final List<BinanceRateLimiter> rateLimits;
  @override
  final List<BinanceExchangeFilter> exchangeFilters;
  @override
  final List<BinanceSymbol> symbols;

  @override
  String toString() {
    return 'BinanceExchangeInfo(timezone: $timezone, serverTime: $serverTime, rateLimits: $rateLimits, exchangeFilters: $exchangeFilters, symbols: $symbols)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BinanceExchangeInfo &&
            const DeepCollectionEquality().equals(other.timezone, timezone) &&
            const DeepCollectionEquality()
                .equals(other.serverTime, serverTime) &&
            const DeepCollectionEquality()
                .equals(other.rateLimits, rateLimits) &&
            const DeepCollectionEquality()
                .equals(other.exchangeFilters, exchangeFilters) &&
            const DeepCollectionEquality().equals(other.symbols, symbols));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(timezone),
      const DeepCollectionEquality().hash(serverTime),
      const DeepCollectionEquality().hash(rateLimits),
      const DeepCollectionEquality().hash(exchangeFilters),
      const DeepCollectionEquality().hash(symbols));

  @JsonKey(ignore: true)
  @override
  _$BinanceExchangeInfoCopyWith<_BinanceExchangeInfo> get copyWith =>
      __$BinanceExchangeInfoCopyWithImpl<_BinanceExchangeInfo>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BinanceExchangeInfoToJson(this);
  }
}

abstract class _BinanceExchangeInfo implements BinanceExchangeInfo {
  factory _BinanceExchangeInfo(
      String timezone,
      int serverTime,
      List<BinanceRateLimiter> rateLimits,
      List<BinanceExchangeFilter> exchangeFilters,
      List<BinanceSymbol> symbols) = _$_BinanceExchangeInfo;

  factory _BinanceExchangeInfo.fromJson(Map<String, dynamic> json) =
      _$_BinanceExchangeInfo.fromJson;

  @override
  String get timezone;
  @override
  int get serverTime;
  @override
  List<BinanceRateLimiter> get rateLimits;
  @override
  List<BinanceExchangeFilter> get exchangeFilters;
  @override
  List<BinanceSymbol> get symbols;
  @override
  @JsonKey(ignore: true)
  _$BinanceExchangeInfoCopyWith<_BinanceExchangeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
