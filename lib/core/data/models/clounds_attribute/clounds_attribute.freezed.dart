// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clounds_attribute.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CloundModel _$CloundModelFromJson(Map<String, dynamic> json) {
  return _CloundModel.fromJson(json);
}

/// @nodoc
mixin _$CloundModel {
  @JsonKey(name: 'all')
  int? get clounds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CloundModelCopyWith<CloundModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CloundModelCopyWith<$Res> {
  factory $CloundModelCopyWith(
          CloundModel value, $Res Function(CloundModel) then) =
      _$CloundModelCopyWithImpl<$Res, CloundModel>;
  @useResult
  $Res call({@JsonKey(name: 'all') int? clounds});
}

/// @nodoc
class _$CloundModelCopyWithImpl<$Res, $Val extends CloundModel>
    implements $CloundModelCopyWith<$Res> {
  _$CloundModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clounds = freezed,
  }) {
    return _then(_value.copyWith(
      clounds: freezed == clounds
          ? _value.clounds
          : clounds // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CloundModelImplCopyWith<$Res>
    implements $CloundModelCopyWith<$Res> {
  factory _$$CloundModelImplCopyWith(
          _$CloundModelImpl value, $Res Function(_$CloundModelImpl) then) =
      __$$CloundModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'all') int? clounds});
}

/// @nodoc
class __$$CloundModelImplCopyWithImpl<$Res>
    extends _$CloundModelCopyWithImpl<$Res, _$CloundModelImpl>
    implements _$$CloundModelImplCopyWith<$Res> {
  __$$CloundModelImplCopyWithImpl(
      _$CloundModelImpl _value, $Res Function(_$CloundModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clounds = freezed,
  }) {
    return _then(_$CloundModelImpl(
      clounds: freezed == clounds
          ? _value.clounds
          : clounds // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CloundModelImpl with DiagnosticableTreeMixin implements _CloundModel {
  _$CloundModelImpl({@JsonKey(name: 'all') this.clounds});

  factory _$CloundModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CloundModelImplFromJson(json);

  @override
  @JsonKey(name: 'all')
  final int? clounds;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CloundModel(clounds: $clounds)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CloundModel'))
      ..add(DiagnosticsProperty('clounds', clounds));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CloundModelImpl &&
            (identical(other.clounds, clounds) || other.clounds == clounds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, clounds);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CloundModelImplCopyWith<_$CloundModelImpl> get copyWith =>
      __$$CloundModelImplCopyWithImpl<_$CloundModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CloundModelImplToJson(
      this,
    );
  }
}

abstract class _CloundModel implements CloundModel {
  factory _CloundModel({@JsonKey(name: 'all') final int? clounds}) =
      _$CloundModelImpl;

  factory _CloundModel.fromJson(Map<String, dynamic> json) =
      _$CloundModelImpl.fromJson;

  @override
  @JsonKey(name: 'all')
  int? get clounds;
  @override
  @JsonKey(ignore: true)
  _$$CloundModelImplCopyWith<_$CloundModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
