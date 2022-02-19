// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'exchange_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BinanceExchangeFilter _$BinanceExchangeFilterFromJson(
    Map<String, dynamic> json) {
  return _BinanceExchangeFilter.fromJson(json);
}

/// @nodoc
class _$BinanceExchangeFilterTearOff {
  const _$BinanceExchangeFilterTearOff();

  _BinanceExchangeFilter call(String filterType, int maxNumAlgoOrders) {
    return _BinanceExchangeFilter(
      filterType,
      maxNumAlgoOrders,
    );
  }

  BinanceExchangeFilter fromJson(Map<String, Object?> json) {
    return BinanceExchangeFilter.fromJson(json);
  }
}

/// @nodoc
const $BinanceExchangeFilter = _$BinanceExchangeFilterTearOff();

/// @nodoc
mixin _$BinanceExchangeFilter {
  String get filterType => throw _privateConstructorUsedError;
  int get maxNumAlgoOrders => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BinanceExchangeFilterCopyWith<BinanceExchangeFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BinanceExchangeFilterCopyWith<$Res> {
  factory $BinanceExchangeFilterCopyWith(BinanceExchangeFilter value,
          $Res Function(BinanceExchangeFilter) then) =
      _$BinanceExchangeFilterCopyWithImpl<$Res>;
  $Res call({String filterType, int maxNumAlgoOrders});
}

/// @nodoc
class _$BinanceExchangeFilterCopyWithImpl<$Res>
    implements $BinanceExchangeFilterCopyWith<$Res> {
  _$BinanceExchangeFilterCopyWithImpl(this._value, this._then);

  final BinanceExchangeFilter _value;
  // ignore: unused_field
  final $Res Function(BinanceExchangeFilter) _then;

  @override
  $Res call({
    Object? filterType = freezed,
    Object? maxNumAlgoOrders = freezed,
  }) {
    return _then(_value.copyWith(
      filterType: filterType == freezed
          ? _value.filterType
          : filterType // ignore: cast_nullable_to_non_nullable
              as String,
      maxNumAlgoOrders: maxNumAlgoOrders == freezed
          ? _value.maxNumAlgoOrders
          : maxNumAlgoOrders // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$BinanceExchangeFilterCopyWith<$Res>
    implements $BinanceExchangeFilterCopyWith<$Res> {
  factory _$BinanceExchangeFilterCopyWith(_BinanceExchangeFilter value,
          $Res Function(_BinanceExchangeFilter) then) =
      __$BinanceExchangeFilterCopyWithImpl<$Res>;
  @override
  $Res call({String filterType, int maxNumAlgoOrders});
}

/// @nodoc
class __$BinanceExchangeFilterCopyWithImpl<$Res>
    extends _$BinanceExchangeFilterCopyWithImpl<$Res>
    implements _$BinanceExchangeFilterCopyWith<$Res> {
  __$BinanceExchangeFilterCopyWithImpl(_BinanceExchangeFilter _value,
      $Res Function(_BinanceExchangeFilter) _then)
      : super(_value, (v) => _then(v as _BinanceExchangeFilter));

  @override
  _BinanceExchangeFilter get _value => super._value as _BinanceExchangeFilter;

  @override
  $Res call({
    Object? filterType = freezed,
    Object? maxNumAlgoOrders = freezed,
  }) {
    return _then(_BinanceExchangeFilter(
      filterType == freezed
          ? _value.filterType
          : filterType // ignore: cast_nullable_to_non_nullable
              as String,
      maxNumAlgoOrders == freezed
          ? _value.maxNumAlgoOrders
          : maxNumAlgoOrders // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BinanceExchangeFilter implements _BinanceExchangeFilter {
  _$_BinanceExchangeFilter(this.filterType, this.maxNumAlgoOrders);

  factory _$_BinanceExchangeFilter.fromJson(Map<String, dynamic> json) =>
      _$$_BinanceExchangeFilterFromJson(json);

  @override
  final String filterType;
  @override
  final int maxNumAlgoOrders;

  @override
  String toString() {
    return 'BinanceExchangeFilter(filterType: $filterType, maxNumAlgoOrders: $maxNumAlgoOrders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BinanceExchangeFilter &&
            const DeepCollectionEquality()
                .equals(other.filterType, filterType) &&
            const DeepCollectionEquality()
                .equals(other.maxNumAlgoOrders, maxNumAlgoOrders));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(filterType),
      const DeepCollectionEquality().hash(maxNumAlgoOrders));

  @JsonKey(ignore: true)
  @override
  _$BinanceExchangeFilterCopyWith<_BinanceExchangeFilter> get copyWith =>
      __$BinanceExchangeFilterCopyWithImpl<_BinanceExchangeFilter>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BinanceExchangeFilterToJson(this);
  }
}

abstract class _BinanceExchangeFilter implements BinanceExchangeFilter {
  factory _BinanceExchangeFilter(String filterType, int maxNumAlgoOrders) =
      _$_BinanceExchangeFilter;

  factory _BinanceExchangeFilter.fromJson(Map<String, dynamic> json) =
      _$_BinanceExchangeFilter.fromJson;

  @override
  String get filterType;
  @override
  int get maxNumAlgoOrders;
  @override
  @JsonKey(ignore: true)
  _$BinanceExchangeFilterCopyWith<_BinanceExchangeFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
