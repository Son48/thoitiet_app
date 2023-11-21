// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_hourly.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WeatherHourlyModel _$WeatherHourlyModelFromJson(Map<String, dynamic> json) {
  return _WeatherHourlyModel.fromJson(json);
}

/// @nodoc
mixin _$WeatherHourlyModel {
  String? get day => throw _privateConstructorUsedError;
  String? get hour => throw _privateConstructorUsedError;
  @JsonKey(name: 'dt')
  double? get dt => throw _privateConstructorUsedError;
  @JsonKey(name: 'weather')
  List<WeatherAttributeModel>? get listStatusWeather =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'temp')
  double? get temp => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_speed')
  double? get windSpeed => throw _privateConstructorUsedError;
  @JsonKey(name: 'clouds')
  int? get clounds => throw _privateConstructorUsedError;
  @JsonKey(name: 'rain')
  RainHourlyModel? get rain => throw _privateConstructorUsedError;
  @JsonKey(name: 'uvi')
  double? get uvi => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherHourlyModelCopyWith<WeatherHourlyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherHourlyModelCopyWith<$Res> {
  factory $WeatherHourlyModelCopyWith(
          WeatherHourlyModel value, $Res Function(WeatherHourlyModel) then) =
      _$WeatherHourlyModelCopyWithImpl<$Res, WeatherHourlyModel>;
  @useResult
  $Res call(
      {String? day,
      String? hour,
      @JsonKey(name: 'dt') double? dt,
      @JsonKey(name: 'weather') List<WeatherAttributeModel>? listStatusWeather,
      @JsonKey(name: 'temp') double? temp,
      @JsonKey(name: 'wind_speed') double? windSpeed,
      @JsonKey(name: 'clouds') int? clounds,
      @JsonKey(name: 'rain') RainHourlyModel? rain,
      @JsonKey(name: 'uvi') double? uvi});

  $RainHourlyModelCopyWith<$Res>? get rain;
}

/// @nodoc
class _$WeatherHourlyModelCopyWithImpl<$Res, $Val extends WeatherHourlyModel>
    implements $WeatherHourlyModelCopyWith<$Res> {
  _$WeatherHourlyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = freezed,
    Object? hour = freezed,
    Object? dt = freezed,
    Object? listStatusWeather = freezed,
    Object? temp = freezed,
    Object? windSpeed = freezed,
    Object? clounds = freezed,
    Object? rain = freezed,
    Object? uvi = freezed,
  }) {
    return _then(_value.copyWith(
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String?,
      hour: freezed == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as String?,
      dt: freezed == dt
          ? _value.dt
          : dt // ignore: cast_nullable_to_non_nullable
              as double?,
      listStatusWeather: freezed == listStatusWeather
          ? _value.listStatusWeather
          : listStatusWeather // ignore: cast_nullable_to_non_nullable
              as List<WeatherAttributeModel>?,
      temp: freezed == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as double?,
      windSpeed: freezed == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double?,
      clounds: freezed == clounds
          ? _value.clounds
          : clounds // ignore: cast_nullable_to_non_nullable
              as int?,
      rain: freezed == rain
          ? _value.rain
          : rain // ignore: cast_nullable_to_non_nullable
              as RainHourlyModel?,
      uvi: freezed == uvi
          ? _value.uvi
          : uvi // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RainHourlyModelCopyWith<$Res>? get rain {
    if (_value.rain == null) {
      return null;
    }

    return $RainHourlyModelCopyWith<$Res>(_value.rain!, (value) {
      return _then(_value.copyWith(rain: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherHourlyModelImplCopyWith<$Res>
    implements $WeatherHourlyModelCopyWith<$Res> {
  factory _$$WeatherHourlyModelImplCopyWith(_$WeatherHourlyModelImpl value,
          $Res Function(_$WeatherHourlyModelImpl) then) =
      __$$WeatherHourlyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? day,
      String? hour,
      @JsonKey(name: 'dt') double? dt,
      @JsonKey(name: 'weather') List<WeatherAttributeModel>? listStatusWeather,
      @JsonKey(name: 'temp') double? temp,
      @JsonKey(name: 'wind_speed') double? windSpeed,
      @JsonKey(name: 'clouds') int? clounds,
      @JsonKey(name: 'rain') RainHourlyModel? rain,
      @JsonKey(name: 'uvi') double? uvi});

  @override
  $RainHourlyModelCopyWith<$Res>? get rain;
}

/// @nodoc
class __$$WeatherHourlyModelImplCopyWithImpl<$Res>
    extends _$WeatherHourlyModelCopyWithImpl<$Res, _$WeatherHourlyModelImpl>
    implements _$$WeatherHourlyModelImplCopyWith<$Res> {
  __$$WeatherHourlyModelImplCopyWithImpl(_$WeatherHourlyModelImpl _value,
      $Res Function(_$WeatherHourlyModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = freezed,
    Object? hour = freezed,
    Object? dt = freezed,
    Object? listStatusWeather = freezed,
    Object? temp = freezed,
    Object? windSpeed = freezed,
    Object? clounds = freezed,
    Object? rain = freezed,
    Object? uvi = freezed,
  }) {
    return _then(_$WeatherHourlyModelImpl(
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String?,
      hour: freezed == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as String?,
      dt: freezed == dt
          ? _value.dt
          : dt // ignore: cast_nullable_to_non_nullable
              as double?,
      listStatusWeather: freezed == listStatusWeather
          ? _value._listStatusWeather
          : listStatusWeather // ignore: cast_nullable_to_non_nullable
              as List<WeatherAttributeModel>?,
      temp: freezed == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as double?,
      windSpeed: freezed == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double?,
      clounds: freezed == clounds
          ? _value.clounds
          : clounds // ignore: cast_nullable_to_non_nullable
              as int?,
      rain: freezed == rain
          ? _value.rain
          : rain // ignore: cast_nullable_to_non_nullable
              as RainHourlyModel?,
      uvi: freezed == uvi
          ? _value.uvi
          : uvi // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherHourlyModelImpl
    with DiagnosticableTreeMixin
    implements _WeatherHourlyModel {
  _$WeatherHourlyModelImpl(
      {this.day,
      this.hour,
      @JsonKey(name: 'dt') this.dt,
      @JsonKey(name: 'weather')
      final List<WeatherAttributeModel>? listStatusWeather,
      @JsonKey(name: 'temp') this.temp,
      @JsonKey(name: 'wind_speed') this.windSpeed,
      @JsonKey(name: 'clouds') this.clounds,
      @JsonKey(name: 'rain') this.rain,
      @JsonKey(name: 'uvi') this.uvi})
      : _listStatusWeather = listStatusWeather;

  factory _$WeatherHourlyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherHourlyModelImplFromJson(json);

  @override
  final String? day;
  @override
  final String? hour;
  @override
  @JsonKey(name: 'dt')
  final double? dt;
  final List<WeatherAttributeModel>? _listStatusWeather;
  @override
  @JsonKey(name: 'weather')
  List<WeatherAttributeModel>? get listStatusWeather {
    final value = _listStatusWeather;
    if (value == null) return null;
    if (_listStatusWeather is EqualUnmodifiableListView)
      return _listStatusWeather;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'temp')
  final double? temp;
  @override
  @JsonKey(name: 'wind_speed')
  final double? windSpeed;
  @override
  @JsonKey(name: 'clouds')
  final int? clounds;
  @override
  @JsonKey(name: 'rain')
  final RainHourlyModel? rain;
  @override
  @JsonKey(name: 'uvi')
  final double? uvi;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WeatherHourlyModel(day: $day, hour: $hour, dt: $dt, listStatusWeather: $listStatusWeather, temp: $temp, windSpeed: $windSpeed, clounds: $clounds, rain: $rain, uvi: $uvi)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WeatherHourlyModel'))
      ..add(DiagnosticsProperty('day', day))
      ..add(DiagnosticsProperty('hour', hour))
      ..add(DiagnosticsProperty('dt', dt))
      ..add(DiagnosticsProperty('listStatusWeather', listStatusWeather))
      ..add(DiagnosticsProperty('temp', temp))
      ..add(DiagnosticsProperty('windSpeed', windSpeed))
      ..add(DiagnosticsProperty('clounds', clounds))
      ..add(DiagnosticsProperty('rain', rain))
      ..add(DiagnosticsProperty('uvi', uvi));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherHourlyModelImpl &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.dt, dt) || other.dt == dt) &&
            const DeepCollectionEquality()
                .equals(other._listStatusWeather, _listStatusWeather) &&
            (identical(other.temp, temp) || other.temp == temp) &&
            (identical(other.windSpeed, windSpeed) ||
                other.windSpeed == windSpeed) &&
            (identical(other.clounds, clounds) || other.clounds == clounds) &&
            (identical(other.rain, rain) || other.rain == rain) &&
            (identical(other.uvi, uvi) || other.uvi == uvi));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      day,
      hour,
      dt,
      const DeepCollectionEquality().hash(_listStatusWeather),
      temp,
      windSpeed,
      clounds,
      rain,
      uvi);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherHourlyModelImplCopyWith<_$WeatherHourlyModelImpl> get copyWith =>
      __$$WeatherHourlyModelImplCopyWithImpl<_$WeatherHourlyModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherHourlyModelImplToJson(
      this,
    );
  }
}

abstract class _WeatherHourlyModel implements WeatherHourlyModel {
  factory _WeatherHourlyModel(
      {final String? day,
      final String? hour,
      @JsonKey(name: 'dt') final double? dt,
      @JsonKey(name: 'weather')
      final List<WeatherAttributeModel>? listStatusWeather,
      @JsonKey(name: 'temp') final double? temp,
      @JsonKey(name: 'wind_speed') final double? windSpeed,
      @JsonKey(name: 'clouds') final int? clounds,
      @JsonKey(name: 'rain') final RainHourlyModel? rain,
      @JsonKey(name: 'uvi') final double? uvi}) = _$WeatherHourlyModelImpl;

  factory _WeatherHourlyModel.fromJson(Map<String, dynamic> json) =
      _$WeatherHourlyModelImpl.fromJson;

  @override
  String? get day;
  @override
  String? get hour;
  @override
  @JsonKey(name: 'dt')
  double? get dt;
  @override
  @JsonKey(name: 'weather')
  List<WeatherAttributeModel>? get listStatusWeather;
  @override
  @JsonKey(name: 'temp')
  double? get temp;
  @override
  @JsonKey(name: 'wind_speed')
  double? get windSpeed;
  @override
  @JsonKey(name: 'clouds')
  int? get clounds;
  @override
  @JsonKey(name: 'rain')
  RainHourlyModel? get rain;
  @override
  @JsonKey(name: 'uvi')
  double? get uvi;
  @override
  @JsonKey(ignore: true)
  _$$WeatherHourlyModelImplCopyWith<_$WeatherHourlyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
