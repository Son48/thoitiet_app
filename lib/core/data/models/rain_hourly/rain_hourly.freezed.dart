// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rain_hourly.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RainHourlyModel _$RainHourlyModelFromJson(Map<String, dynamic> json) {
  return _RainHourlyModel.fromJson(json);
}

/// @nodoc
mixin _$RainHourlyModel {
  @JsonKey(name: '1h')
  double? get rain => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RainHourlyModelCopyWith<RainHourlyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RainHourlyModelCopyWith<$Res> {
  factory $RainHourlyModelCopyWith(
          RainHourlyModel value, $Res Function(RainHourlyModel) then) =
      _$RainHourlyModelCopyWithImpl<$Res, RainHourlyModel>;
  @useResult
  $Res call({@JsonKey(name: '1h') double? rain});
}

/// @nodoc
class _$RainHourlyModelCopyWithImpl<$Res, $Val extends RainHourlyModel>
    implements $RainHourlyModelCopyWith<$Res> {
  _$RainHourlyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rain = freezed,
  }) {
    return _then(_value.copyWith(
      rain: freezed == rain
          ? _value.rain
          : rain // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RainHourlyModelImplCopyWith<$Res>
    implements $RainHourlyModelCopyWith<$Res> {
  factory _$$RainHourlyModelImplCopyWith(_$RainHourlyModelImpl value,
          $Res Function(_$RainHourlyModelImpl) then) =
      __$$RainHourlyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: '1h') double? rain});
}

/// @nodoc
class __$$RainHourlyModelImplCopyWithImpl<$Res>
    extends _$RainHourlyModelCopyWithImpl<$Res, _$RainHourlyModelImpl>
    implements _$$RainHourlyModelImplCopyWith<$Res> {
  __$$RainHourlyModelImplCopyWithImpl(
      _$RainHourlyModelImpl _value, $Res Function(_$RainHourlyModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rain = freezed,
  }) {
    return _then(_$RainHourlyModelImpl(
      rain: freezed == rain
          ? _value.rain
          : rain // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RainHourlyModelImpl
    with DiagnosticableTreeMixin
    implements _RainHourlyModel {
  _$RainHourlyModelImpl({@JsonKey(name: '1h') this.rain});

  factory _$RainHourlyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RainHourlyModelImplFromJson(json);

  @override
  @JsonKey(name: '1h')
  final double? rain;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RainHourlyModel(rain: $rain)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RainHourlyModel'))
      ..add(DiagnosticsProperty('rain', rain));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RainHourlyModelImpl &&
            (identical(other.rain, rain) || other.rain == rain));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, rain);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RainHourlyModelImplCopyWith<_$RainHourlyModelImpl> get copyWith =>
      __$$RainHourlyModelImplCopyWithImpl<_$RainHourlyModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RainHourlyModelImplToJson(
      this,
    );
  }
}

abstract class _RainHourlyModel implements RainHourlyModel {
  factory _RainHourlyModel({@JsonKey(name: '1h') final double? rain}) =
      _$RainHourlyModelImpl;

  factory _RainHourlyModel.fromJson(Map<String, dynamic> json) =
      _$RainHourlyModelImpl.fromJson;

  @override
  @JsonKey(name: '1h')
  double? get rain;
  @override
  @JsonKey(ignore: true)
  _$$RainHourlyModelImplCopyWith<_$RainHourlyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
