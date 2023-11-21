// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rain.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RainModel _$RainModelFromJson(Map<String, dynamic> json) {
  return _RainModel.fromJson(json);
}

/// @nodoc
mixin _$RainModel {
  @JsonKey(name: 'rain')
  String? get rain => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RainModelCopyWith<RainModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RainModelCopyWith<$Res> {
  factory $RainModelCopyWith(RainModel value, $Res Function(RainModel) then) =
      _$RainModelCopyWithImpl<$Res, RainModel>;
  @useResult
  $Res call({@JsonKey(name: 'rain') String? rain});
}

/// @nodoc
class _$RainModelCopyWithImpl<$Res, $Val extends RainModel>
    implements $RainModelCopyWith<$Res> {
  _$RainModelCopyWithImpl(this._value, this._then);

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
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RainModelImplCopyWith<$Res>
    implements $RainModelCopyWith<$Res> {
  factory _$$RainModelImplCopyWith(
          _$RainModelImpl value, $Res Function(_$RainModelImpl) then) =
      __$$RainModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'rain') String? rain});
}

/// @nodoc
class __$$RainModelImplCopyWithImpl<$Res>
    extends _$RainModelCopyWithImpl<$Res, _$RainModelImpl>
    implements _$$RainModelImplCopyWith<$Res> {
  __$$RainModelImplCopyWithImpl(
      _$RainModelImpl _value, $Res Function(_$RainModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rain = freezed,
  }) {
    return _then(_$RainModelImpl(
      rain: freezed == rain
          ? _value.rain
          : rain // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RainModelImpl with DiagnosticableTreeMixin implements _RainModel {
  _$RainModelImpl({@JsonKey(name: 'rain') this.rain});

  factory _$RainModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RainModelImplFromJson(json);

  @override
  @JsonKey(name: 'rain')
  final String? rain;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RainModel(rain: $rain)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RainModel'))
      ..add(DiagnosticsProperty('rain', rain));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RainModelImpl &&
            (identical(other.rain, rain) || other.rain == rain));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, rain);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RainModelImplCopyWith<_$RainModelImpl> get copyWith =>
      __$$RainModelImplCopyWithImpl<_$RainModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RainModelImplToJson(
      this,
    );
  }
}

abstract class _RainModel implements RainModel {
  factory _RainModel({@JsonKey(name: 'rain') final String? rain}) =
      _$RainModelImpl;

  factory _RainModel.fromJson(Map<String, dynamic> json) =
      _$RainModelImpl.fromJson;

  @override
  @JsonKey(name: 'rain')
  String? get rain;
  @override
  @JsonKey(ignore: true)
  _$$RainModelImplCopyWith<_$RainModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
