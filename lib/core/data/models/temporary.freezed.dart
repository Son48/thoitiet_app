// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'temporary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TemporaryModel _$TemporaryModelFromJson(Map<String, dynamic> json) {
  return _TemporaryModel.fromJson(json);
}

/// @nodoc
mixin _$TemporaryModel {
  @JsonKey(name: 'temp')
  String? get temp => throw _privateConstructorUsedError;
  @JsonKey(name: 'feels_like')
  String? get feelsLike => throw _privateConstructorUsedError;
  @JsonKey(name: 'temp_min')
  String? get tempMin => throw _privateConstructorUsedError;
  @JsonKey(name: 'temp_max')
  String? get temmMax => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TemporaryModelCopyWith<TemporaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemporaryModelCopyWith<$Res> {
  factory $TemporaryModelCopyWith(
          TemporaryModel value, $Res Function(TemporaryModel) then) =
      _$TemporaryModelCopyWithImpl<$Res, TemporaryModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'temp') String? temp,
      @JsonKey(name: 'feels_like') String? feelsLike,
      @JsonKey(name: 'temp_min') String? tempMin,
      @JsonKey(name: 'temp_max') String? temmMax});
}

/// @nodoc
class _$TemporaryModelCopyWithImpl<$Res, $Val extends TemporaryModel>
    implements $TemporaryModelCopyWith<$Res> {
  _$TemporaryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = freezed,
    Object? feelsLike = freezed,
    Object? tempMin = freezed,
    Object? temmMax = freezed,
  }) {
    return _then(_value.copyWith(
      temp: freezed == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as String?,
      feelsLike: freezed == feelsLike
          ? _value.feelsLike
          : feelsLike // ignore: cast_nullable_to_non_nullable
              as String?,
      tempMin: freezed == tempMin
          ? _value.tempMin
          : tempMin // ignore: cast_nullable_to_non_nullable
              as String?,
      temmMax: freezed == temmMax
          ? _value.temmMax
          : temmMax // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TemporaryModelImplCopyWith<$Res>
    implements $TemporaryModelCopyWith<$Res> {
  factory _$$TemporaryModelImplCopyWith(_$TemporaryModelImpl value,
          $Res Function(_$TemporaryModelImpl) then) =
      __$$TemporaryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'temp') String? temp,
      @JsonKey(name: 'feels_like') String? feelsLike,
      @JsonKey(name: 'temp_min') String? tempMin,
      @JsonKey(name: 'temp_max') String? temmMax});
}

/// @nodoc
class __$$TemporaryModelImplCopyWithImpl<$Res>
    extends _$TemporaryModelCopyWithImpl<$Res, _$TemporaryModelImpl>
    implements _$$TemporaryModelImplCopyWith<$Res> {
  __$$TemporaryModelImplCopyWithImpl(
      _$TemporaryModelImpl _value, $Res Function(_$TemporaryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = freezed,
    Object? feelsLike = freezed,
    Object? tempMin = freezed,
    Object? temmMax = freezed,
  }) {
    return _then(_$TemporaryModelImpl(
      temp: freezed == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as String?,
      feelsLike: freezed == feelsLike
          ? _value.feelsLike
          : feelsLike // ignore: cast_nullable_to_non_nullable
              as String?,
      tempMin: freezed == tempMin
          ? _value.tempMin
          : tempMin // ignore: cast_nullable_to_non_nullable
              as String?,
      temmMax: freezed == temmMax
          ? _value.temmMax
          : temmMax // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TemporaryModelImpl
    with DiagnosticableTreeMixin
    implements _TemporaryModel {
  _$TemporaryModelImpl(
      {@JsonKey(name: 'temp') this.temp,
      @JsonKey(name: 'feels_like') this.feelsLike,
      @JsonKey(name: 'temp_min') this.tempMin,
      @JsonKey(name: 'temp_max') this.temmMax});

  factory _$TemporaryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TemporaryModelImplFromJson(json);

  @override
  @JsonKey(name: 'temp')
  final String? temp;
  @override
  @JsonKey(name: 'feels_like')
  final String? feelsLike;
  @override
  @JsonKey(name: 'temp_min')
  final String? tempMin;
  @override
  @JsonKey(name: 'temp_max')
  final String? temmMax;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TemporaryModel(temp: $temp, feelsLike: $feelsLike, tempMin: $tempMin, temmMax: $temmMax)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TemporaryModel'))
      ..add(DiagnosticsProperty('temp', temp))
      ..add(DiagnosticsProperty('feelsLike', feelsLike))
      ..add(DiagnosticsProperty('tempMin', tempMin))
      ..add(DiagnosticsProperty('temmMax', temmMax));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemporaryModelImpl &&
            (identical(other.temp, temp) || other.temp == temp) &&
            (identical(other.feelsLike, feelsLike) ||
                other.feelsLike == feelsLike) &&
            (identical(other.tempMin, tempMin) || other.tempMin == tempMin) &&
            (identical(other.temmMax, temmMax) || other.temmMax == temmMax));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, temp, feelsLike, tempMin, temmMax);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TemporaryModelImplCopyWith<_$TemporaryModelImpl> get copyWith =>
      __$$TemporaryModelImplCopyWithImpl<_$TemporaryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TemporaryModelImplToJson(
      this,
    );
  }
}

abstract class _TemporaryModel implements TemporaryModel {
  factory _TemporaryModel(
      {@JsonKey(name: 'temp') final String? temp,
      @JsonKey(name: 'feels_like') final String? feelsLike,
      @JsonKey(name: 'temp_min') final String? tempMin,
      @JsonKey(name: 'temp_max') final String? temmMax}) = _$TemporaryModelImpl;

  factory _TemporaryModel.fromJson(Map<String, dynamic> json) =
      _$TemporaryModelImpl.fromJson;

  @override
  @JsonKey(name: 'temp')
  String? get temp;
  @override
  @JsonKey(name: 'feels_like')
  String? get feelsLike;
  @override
  @JsonKey(name: 'temp_min')
  String? get tempMin;
  @override
  @JsonKey(name: 'temp_max')
  String? get temmMax;
  @override
  @JsonKey(ignore: true)
  _$$TemporaryModelImplCopyWith<_$TemporaryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
