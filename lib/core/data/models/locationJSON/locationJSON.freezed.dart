// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'locationJSON.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocationJSONModel _$LocationJSONModelFromJson(Map<String, dynamic> json) {
  return _LocationJSONModel.fromJson(json);
}

/// @nodoc
mixin _$LocationJSONModel {
  @JsonKey(name: 'name')
  String? get nameLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'coord')
  CoordModel? get coord => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationJSONModelCopyWith<LocationJSONModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationJSONModelCopyWith<$Res> {
  factory $LocationJSONModelCopyWith(
          LocationJSONModel value, $Res Function(LocationJSONModel) then) =
      _$LocationJSONModelCopyWithImpl<$Res, LocationJSONModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? nameLocation,
      @JsonKey(name: 'coord') CoordModel? coord});

  $CoordModelCopyWith<$Res>? get coord;
}

/// @nodoc
class _$LocationJSONModelCopyWithImpl<$Res, $Val extends LocationJSONModel>
    implements $LocationJSONModelCopyWith<$Res> {
  _$LocationJSONModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameLocation = freezed,
    Object? coord = freezed,
  }) {
    return _then(_value.copyWith(
      nameLocation: freezed == nameLocation
          ? _value.nameLocation
          : nameLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      coord: freezed == coord
          ? _value.coord
          : coord // ignore: cast_nullable_to_non_nullable
              as CoordModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CoordModelCopyWith<$Res>? get coord {
    if (_value.coord == null) {
      return null;
    }

    return $CoordModelCopyWith<$Res>(_value.coord!, (value) {
      return _then(_value.copyWith(coord: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LocationJSONModelImplCopyWith<$Res>
    implements $LocationJSONModelCopyWith<$Res> {
  factory _$$LocationJSONModelImplCopyWith(_$LocationJSONModelImpl value,
          $Res Function(_$LocationJSONModelImpl) then) =
      __$$LocationJSONModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? nameLocation,
      @JsonKey(name: 'coord') CoordModel? coord});

  @override
  $CoordModelCopyWith<$Res>? get coord;
}

/// @nodoc
class __$$LocationJSONModelImplCopyWithImpl<$Res>
    extends _$LocationJSONModelCopyWithImpl<$Res, _$LocationJSONModelImpl>
    implements _$$LocationJSONModelImplCopyWith<$Res> {
  __$$LocationJSONModelImplCopyWithImpl(_$LocationJSONModelImpl _value,
      $Res Function(_$LocationJSONModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameLocation = freezed,
    Object? coord = freezed,
  }) {
    return _then(_$LocationJSONModelImpl(
      nameLocation: freezed == nameLocation
          ? _value.nameLocation
          : nameLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      coord: freezed == coord
          ? _value.coord
          : coord // ignore: cast_nullable_to_non_nullable
              as CoordModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationJSONModelImpl
    with DiagnosticableTreeMixin
    implements _LocationJSONModel {
  _$LocationJSONModelImpl(
      {@JsonKey(name: 'name') this.nameLocation,
      @JsonKey(name: 'coord') this.coord});

  factory _$LocationJSONModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationJSONModelImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? nameLocation;
  @override
  @JsonKey(name: 'coord')
  final CoordModel? coord;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocationJSONModel(nameLocation: $nameLocation, coord: $coord)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocationJSONModel'))
      ..add(DiagnosticsProperty('nameLocation', nameLocation))
      ..add(DiagnosticsProperty('coord', coord));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationJSONModelImpl &&
            (identical(other.nameLocation, nameLocation) ||
                other.nameLocation == nameLocation) &&
            (identical(other.coord, coord) || other.coord == coord));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nameLocation, coord);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationJSONModelImplCopyWith<_$LocationJSONModelImpl> get copyWith =>
      __$$LocationJSONModelImplCopyWithImpl<_$LocationJSONModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationJSONModelImplToJson(
      this,
    );
  }
}

abstract class _LocationJSONModel implements LocationJSONModel {
  factory _LocationJSONModel(
          {@JsonKey(name: 'name') final String? nameLocation,
          @JsonKey(name: 'coord') final CoordModel? coord}) =
      _$LocationJSONModelImpl;

  factory _LocationJSONModel.fromJson(Map<String, dynamic> json) =
      _$LocationJSONModelImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get nameLocation;
  @override
  @JsonKey(name: 'coord')
  CoordModel? get coord;
  @override
  @JsonKey(ignore: true)
  _$$LocationJSONModelImplCopyWith<_$LocationJSONModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
