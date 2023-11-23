// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_notifi.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SettingNotificationModel _$SettingNotificationModelFromJson(
    Map<String, dynamic> json) {
  return _SettingNotificationModel.fromJson(json);
}

/// @nodoc
mixin _$SettingNotificationModel {
  @JsonKey(name: 'lat')
  double? get lat => throw _privateConstructorUsedError;
  @JsonKey(name: 'lon')
  double? get lon => throw _privateConstructorUsedError;
  @JsonKey(name: 'hour')
  int? get hour => throw _privateConstructorUsedError;
  @JsonKey(name: 'minute')
  int? get minute => throw _privateConstructorUsedError;
  @JsonKey(name: 'nameLocation')
  String? get nameLocation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingNotificationModelCopyWith<SettingNotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingNotificationModelCopyWith<$Res> {
  factory $SettingNotificationModelCopyWith(SettingNotificationModel value,
          $Res Function(SettingNotificationModel) then) =
      _$SettingNotificationModelCopyWithImpl<$Res, SettingNotificationModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'lat') double? lat,
      @JsonKey(name: 'lon') double? lon,
      @JsonKey(name: 'hour') int? hour,
      @JsonKey(name: 'minute') int? minute,
      @JsonKey(name: 'nameLocation') String? nameLocation});
}

/// @nodoc
class _$SettingNotificationModelCopyWithImpl<$Res,
        $Val extends SettingNotificationModel>
    implements $SettingNotificationModelCopyWith<$Res> {
  _$SettingNotificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = freezed,
    Object? lon = freezed,
    Object? hour = freezed,
    Object? minute = freezed,
    Object? nameLocation = freezed,
  }) {
    return _then(_value.copyWith(
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
      hour: freezed == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int?,
      minute: freezed == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int?,
      nameLocation: freezed == nameLocation
          ? _value.nameLocation
          : nameLocation // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingNotificationModelImplCopyWith<$Res>
    implements $SettingNotificationModelCopyWith<$Res> {
  factory _$$SettingNotificationModelImplCopyWith(
          _$SettingNotificationModelImpl value,
          $Res Function(_$SettingNotificationModelImpl) then) =
      __$$SettingNotificationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'lat') double? lat,
      @JsonKey(name: 'lon') double? lon,
      @JsonKey(name: 'hour') int? hour,
      @JsonKey(name: 'minute') int? minute,
      @JsonKey(name: 'nameLocation') String? nameLocation});
}

/// @nodoc
class __$$SettingNotificationModelImplCopyWithImpl<$Res>
    extends _$SettingNotificationModelCopyWithImpl<$Res,
        _$SettingNotificationModelImpl>
    implements _$$SettingNotificationModelImplCopyWith<$Res> {
  __$$SettingNotificationModelImplCopyWithImpl(
      _$SettingNotificationModelImpl _value,
      $Res Function(_$SettingNotificationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = freezed,
    Object? lon = freezed,
    Object? hour = freezed,
    Object? minute = freezed,
    Object? nameLocation = freezed,
  }) {
    return _then(_$SettingNotificationModelImpl(
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
      hour: freezed == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int?,
      minute: freezed == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int?,
      nameLocation: freezed == nameLocation
          ? _value.nameLocation
          : nameLocation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SettingNotificationModelImpl
    with DiagnosticableTreeMixin
    implements _SettingNotificationModel {
  _$SettingNotificationModelImpl(
      {@JsonKey(name: 'lat') this.lat,
      @JsonKey(name: 'lon') this.lon,
      @JsonKey(name: 'hour') this.hour,
      @JsonKey(name: 'minute') this.minute,
      @JsonKey(name: 'nameLocation') this.nameLocation});

  factory _$SettingNotificationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettingNotificationModelImplFromJson(json);

  @override
  @JsonKey(name: 'lat')
  final double? lat;
  @override
  @JsonKey(name: 'lon')
  final double? lon;
  @override
  @JsonKey(name: 'hour')
  final int? hour;
  @override
  @JsonKey(name: 'minute')
  final int? minute;
  @override
  @JsonKey(name: 'nameLocation')
  final String? nameLocation;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SettingNotificationModel(lat: $lat, lon: $lon, hour: $hour, minute: $minute, nameLocation: $nameLocation)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SettingNotificationModel'))
      ..add(DiagnosticsProperty('lat', lat))
      ..add(DiagnosticsProperty('lon', lon))
      ..add(DiagnosticsProperty('hour', hour))
      ..add(DiagnosticsProperty('minute', minute))
      ..add(DiagnosticsProperty('nameLocation', nameLocation));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingNotificationModelImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.minute, minute) || other.minute == minute) &&
            (identical(other.nameLocation, nameLocation) ||
                other.nameLocation == nameLocation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, lat, lon, hour, minute, nameLocation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingNotificationModelImplCopyWith<_$SettingNotificationModelImpl>
      get copyWith => __$$SettingNotificationModelImplCopyWithImpl<
          _$SettingNotificationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SettingNotificationModelImplToJson(
      this,
    );
  }
}

abstract class _SettingNotificationModel implements SettingNotificationModel {
  factory _SettingNotificationModel(
          {@JsonKey(name: 'lat') final double? lat,
          @JsonKey(name: 'lon') final double? lon,
          @JsonKey(name: 'hour') final int? hour,
          @JsonKey(name: 'minute') final int? minute,
          @JsonKey(name: 'nameLocation') final String? nameLocation}) =
      _$SettingNotificationModelImpl;

  factory _SettingNotificationModel.fromJson(Map<String, dynamic> json) =
      _$SettingNotificationModelImpl.fromJson;

  @override
  @JsonKey(name: 'lat')
  double? get lat;
  @override
  @JsonKey(name: 'lon')
  double? get lon;
  @override
  @JsonKey(name: 'hour')
  int? get hour;
  @override
  @JsonKey(name: 'minute')
  int? get minute;
  @override
  @JsonKey(name: 'nameLocation')
  String? get nameLocation;
  @override
  @JsonKey(ignore: true)
  _$$SettingNotificationModelImplCopyWith<_$SettingNotificationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
