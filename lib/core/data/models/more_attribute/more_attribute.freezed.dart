// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'more_attribute.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MoreAttributeModel _$MoreAttributeModelFromJson(Map<String, dynamic> json) {
  return _MoreAttributeModel.fromJson(json);
}

/// @nodoc
mixin _$MoreAttributeModel {
  @JsonKey(name: 'visibility')
  String? get visibility => throw _privateConstructorUsedError;
  @JsonKey(name: 'uvi')
  String? get uvi => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MoreAttributeModelCopyWith<MoreAttributeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoreAttributeModelCopyWith<$Res> {
  factory $MoreAttributeModelCopyWith(
          MoreAttributeModel value, $Res Function(MoreAttributeModel) then) =
      _$MoreAttributeModelCopyWithImpl<$Res, MoreAttributeModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'visibility') String? visibility,
      @JsonKey(name: 'uvi') String? uvi});
}

/// @nodoc
class _$MoreAttributeModelCopyWithImpl<$Res, $Val extends MoreAttributeModel>
    implements $MoreAttributeModelCopyWith<$Res> {
  _$MoreAttributeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visibility = freezed,
    Object? uvi = freezed,
  }) {
    return _then(_value.copyWith(
      visibility: freezed == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as String?,
      uvi: freezed == uvi
          ? _value.uvi
          : uvi // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MoreAttributeModelImplCopyWith<$Res>
    implements $MoreAttributeModelCopyWith<$Res> {
  factory _$$MoreAttributeModelImplCopyWith(_$MoreAttributeModelImpl value,
          $Res Function(_$MoreAttributeModelImpl) then) =
      __$$MoreAttributeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'visibility') String? visibility,
      @JsonKey(name: 'uvi') String? uvi});
}

/// @nodoc
class __$$MoreAttributeModelImplCopyWithImpl<$Res>
    extends _$MoreAttributeModelCopyWithImpl<$Res, _$MoreAttributeModelImpl>
    implements _$$MoreAttributeModelImplCopyWith<$Res> {
  __$$MoreAttributeModelImplCopyWithImpl(_$MoreAttributeModelImpl _value,
      $Res Function(_$MoreAttributeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visibility = freezed,
    Object? uvi = freezed,
  }) {
    return _then(_$MoreAttributeModelImpl(
      visibility: freezed == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as String?,
      uvi: freezed == uvi
          ? _value.uvi
          : uvi // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MoreAttributeModelImpl
    with DiagnosticableTreeMixin
    implements _MoreAttributeModel {
  _$MoreAttributeModelImpl(
      {@JsonKey(name: 'visibility') this.visibility,
      @JsonKey(name: 'uvi') this.uvi});

  factory _$MoreAttributeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MoreAttributeModelImplFromJson(json);

  @override
  @JsonKey(name: 'visibility')
  final String? visibility;
  @override
  @JsonKey(name: 'uvi')
  final String? uvi;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MoreAttributeModel(visibility: $visibility, uvi: $uvi)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MoreAttributeModel'))
      ..add(DiagnosticsProperty('visibility', visibility))
      ..add(DiagnosticsProperty('uvi', uvi));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoreAttributeModelImpl &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.uvi, uvi) || other.uvi == uvi));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, visibility, uvi);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MoreAttributeModelImplCopyWith<_$MoreAttributeModelImpl> get copyWith =>
      __$$MoreAttributeModelImplCopyWithImpl<_$MoreAttributeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MoreAttributeModelImplToJson(
      this,
    );
  }
}

abstract class _MoreAttributeModel implements MoreAttributeModel {
  factory _MoreAttributeModel(
      {@JsonKey(name: 'visibility') final String? visibility,
      @JsonKey(name: 'uvi') final String? uvi}) = _$MoreAttributeModelImpl;

  factory _MoreAttributeModel.fromJson(Map<String, dynamic> json) =
      _$MoreAttributeModelImpl.fromJson;

  @override
  @JsonKey(name: 'visibility')
  String? get visibility;
  @override
  @JsonKey(name: 'uvi')
  String? get uvi;
  @override
  @JsonKey(ignore: true)
  _$$MoreAttributeModelImplCopyWith<_$MoreAttributeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
