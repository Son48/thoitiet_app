// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sun_status_attribute.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SunModel _$SunModelFromJson(Map<String, dynamic> json) {
  return _SunModel.fromJson(json);
}

/// @nodoc
mixin _$SunModel {
  @JsonKey(name: 'sunrise')
  String? get sunRise => throw _privateConstructorUsedError;
  @JsonKey(name: 'sunset')
  String? get sunSet => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SunModelCopyWith<SunModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SunModelCopyWith<$Res> {
  factory $SunModelCopyWith(SunModel value, $Res Function(SunModel) then) =
      _$SunModelCopyWithImpl<$Res, SunModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'sunrise') String? sunRise,
      @JsonKey(name: 'sunset') String? sunSet});
}

/// @nodoc
class _$SunModelCopyWithImpl<$Res, $Val extends SunModel>
    implements $SunModelCopyWith<$Res> {
  _$SunModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sunRise = freezed,
    Object? sunSet = freezed,
  }) {
    return _then(_value.copyWith(
      sunRise: freezed == sunRise
          ? _value.sunRise
          : sunRise // ignore: cast_nullable_to_non_nullable
              as String?,
      sunSet: freezed == sunSet
          ? _value.sunSet
          : sunSet // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SunModelImplCopyWith<$Res>
    implements $SunModelCopyWith<$Res> {
  factory _$$SunModelImplCopyWith(
          _$SunModelImpl value, $Res Function(_$SunModelImpl) then) =
      __$$SunModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'sunrise') String? sunRise,
      @JsonKey(name: 'sunset') String? sunSet});
}

/// @nodoc
class __$$SunModelImplCopyWithImpl<$Res>
    extends _$SunModelCopyWithImpl<$Res, _$SunModelImpl>
    implements _$$SunModelImplCopyWith<$Res> {
  __$$SunModelImplCopyWithImpl(
      _$SunModelImpl _value, $Res Function(_$SunModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sunRise = freezed,
    Object? sunSet = freezed,
  }) {
    return _then(_$SunModelImpl(
      sunRise: freezed == sunRise
          ? _value.sunRise
          : sunRise // ignore: cast_nullable_to_non_nullable
              as String?,
      sunSet: freezed == sunSet
          ? _value.sunSet
          : sunSet // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SunModelImpl with DiagnosticableTreeMixin implements _SunModel {
  _$SunModelImpl(
      {@JsonKey(name: 'sunrise') this.sunRise,
      @JsonKey(name: 'sunset') this.sunSet});

  factory _$SunModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SunModelImplFromJson(json);

  @override
  @JsonKey(name: 'sunrise')
  final String? sunRise;
  @override
  @JsonKey(name: 'sunset')
  final String? sunSet;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SunModel(sunRise: $sunRise, sunSet: $sunSet)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SunModel'))
      ..add(DiagnosticsProperty('sunRise', sunRise))
      ..add(DiagnosticsProperty('sunSet', sunSet));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SunModelImpl &&
            (identical(other.sunRise, sunRise) || other.sunRise == sunRise) &&
            (identical(other.sunSet, sunSet) || other.sunSet == sunSet));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sunRise, sunSet);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SunModelImplCopyWith<_$SunModelImpl> get copyWith =>
      __$$SunModelImplCopyWithImpl<_$SunModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SunModelImplToJson(
      this,
    );
  }
}

abstract class _SunModel implements SunModel {
  factory _SunModel(
      {@JsonKey(name: 'sunrise') final String? sunRise,
      @JsonKey(name: 'sunset') final String? sunSet}) = _$SunModelImpl;

  factory _SunModel.fromJson(Map<String, dynamic> json) =
      _$SunModelImpl.fromJson;

  @override
  @JsonKey(name: 'sunrise')
  String? get sunRise;
  @override
  @JsonKey(name: 'sunset')
  String? get sunSet;
  @override
  @JsonKey(ignore: true)
  _$$SunModelImplCopyWith<_$SunModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
