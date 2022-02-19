// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rate_limiter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BinanceRateLimiter _$BinanceRateLimiterFromJson(Map<String, dynamic> json) {
  return _BinanceRateLimiter.fromJson(json);
}

/// @nodoc
class _$BinanceRateLimiterTearOff {
  const _$BinanceRateLimiterTearOff();

  _BinanceRateLimiter call(
      String rateLimitType, String interval, int intervalNum, int limit) {
    return _BinanceRateLimiter(
      rateLimitType,
      interval,
      intervalNum,
      limit,
    );
  }

  BinanceRateLimiter fromJson(Map<String, Object?> json) {
    return BinanceRateLimiter.fromJson(json);
  }
}

/// @nodoc
const $BinanceRateLimiter = _$BinanceRateLimiterTearOff();

/// @nodoc
mixin _$BinanceRateLimiter {
  String get rateLimitType => throw _privateConstructorUsedError;
  String get interval => throw _privateConstructorUsedError;
  int get intervalNum => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BinanceRateLimiterCopyWith<BinanceRateLimiter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BinanceRateLimiterCopyWith<$Res> {
  factory $BinanceRateLimiterCopyWith(
          BinanceRateLimiter value, $Res Function(BinanceRateLimiter) then) =
      _$BinanceRateLimiterCopyWithImpl<$Res>;
  $Res call(
      {String rateLimitType, String interval, int intervalNum, int limit});
}

/// @nodoc
class _$BinanceRateLimiterCopyWithImpl<$Res>
    implements $BinanceRateLimiterCopyWith<$Res> {
  _$BinanceRateLimiterCopyWithImpl(this._value, this._then);

  final BinanceRateLimiter _value;
  // ignore: unused_field
  final $Res Function(BinanceRateLimiter) _then;

  @override
  $Res call({
    Object? rateLimitType = freezed,
    Object? interval = freezed,
    Object? intervalNum = freezed,
    Object? limit = freezed,
  }) {
    return _then(_value.copyWith(
      rateLimitType: rateLimitType == freezed
          ? _value.rateLimitType
          : rateLimitType // ignore: cast_nullable_to_non_nullable
              as String,
      interval: interval == freezed
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as String,
      intervalNum: intervalNum == freezed
          ? _value.intervalNum
          : intervalNum // ignore: cast_nullable_to_non_nullable
              as int,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$BinanceRateLimiterCopyWith<$Res>
    implements $BinanceRateLimiterCopyWith<$Res> {
  factory _$BinanceRateLimiterCopyWith(
          _BinanceRateLimiter value, $Res Function(_BinanceRateLimiter) then) =
      __$BinanceRateLimiterCopyWithImpl<$Res>;
  @override
  $Res call(
      {String rateLimitType, String interval, int intervalNum, int limit});
}

/// @nodoc
class __$BinanceRateLimiterCopyWithImpl<$Res>
    extends _$BinanceRateLimiterCopyWithImpl<$Res>
    implements _$BinanceRateLimiterCopyWith<$Res> {
  __$BinanceRateLimiterCopyWithImpl(
      _BinanceRateLimiter _value, $Res Function(_BinanceRateLimiter) _then)
      : super(_value, (v) => _then(v as _BinanceRateLimiter));

  @override
  _BinanceRateLimiter get _value => super._value as _BinanceRateLimiter;

  @override
  $Res call({
    Object? rateLimitType = freezed,
    Object? interval = freezed,
    Object? intervalNum = freezed,
    Object? limit = freezed,
  }) {
    return _then(_BinanceRateLimiter(
      rateLimitType == freezed
          ? _value.rateLimitType
          : rateLimitType // ignore: cast_nullable_to_non_nullable
              as String,
      interval == freezed
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as String,
      intervalNum == freezed
          ? _value.intervalNum
          : intervalNum // ignore: cast_nullable_to_non_nullable
              as int,
      limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BinanceRateLimiter implements _BinanceRateLimiter {
  _$_BinanceRateLimiter(
      this.rateLimitType, this.interval, this.intervalNum, this.limit);

  factory _$_BinanceRateLimiter.fromJson(Map<String, dynamic> json) =>
      _$$_BinanceRateLimiterFromJson(json);

  @override
  final String rateLimitType;
  @override
  final String interval;
  @override
  final int intervalNum;
  @override
  final int limit;

  @override
  String toString() {
    return 'BinanceRateLimiter(rateLimitType: $rateLimitType, interval: $interval, intervalNum: $intervalNum, limit: $limit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BinanceRateLimiter &&
            const DeepCollectionEquality()
                .equals(other.rateLimitType, rateLimitType) &&
            const DeepCollectionEquality().equals(other.interval, interval) &&
            const DeepCollectionEquality()
                .equals(other.intervalNum, intervalNum) &&
            const DeepCollectionEquality().equals(other.limit, limit));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(rateLimitType),
      const DeepCollectionEquality().hash(interval),
      const DeepCollectionEquality().hash(intervalNum),
      const DeepCollectionEquality().hash(limit));

  @JsonKey(ignore: true)
  @override
  _$BinanceRateLimiterCopyWith<_BinanceRateLimiter> get copyWith =>
      __$BinanceRateLimiterCopyWithImpl<_BinanceRateLimiter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BinanceRateLimiterToJson(this);
  }
}

abstract class _BinanceRateLimiter implements BinanceRateLimiter {
  factory _BinanceRateLimiter(
          String rateLimitType, String interval, int intervalNum, int limit) =
      _$_BinanceRateLimiter;

  factory _BinanceRateLimiter.fromJson(Map<String, dynamic> json) =
      _$_BinanceRateLimiter.fromJson;

  @override
  String get rateLimitType;
  @override
  String get interval;
  @override
  int get intervalNum;
  @override
  int get limit;
  @override
  @JsonKey(ignore: true)
  _$BinanceRateLimiterCopyWith<_BinanceRateLimiter> get copyWith =>
      throw _privateConstructorUsedError;
}
