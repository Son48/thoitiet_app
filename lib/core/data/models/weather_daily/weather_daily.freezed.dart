// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_daily.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WeatherDailyModel _$WeatherDailyModelFromJson(Map<String, dynamic> json) {
  return _WeatherDailyModel.fromJson(json);
}

/// @nodoc
mixin _$WeatherDailyModel {
  String? get day => throw _privateConstructorUsedError;
  String? get hour => throw _privateConstructorUsedError;
  @JsonKey(name: 'weather')
  List<WeatherAttributeModel>? get listStatusWeather =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'temp')
  TemperatureDailyModel? get temp => throw _privateConstructorUsedError;
  @JsonKey(name: 'dt')
  double? get dt => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_speed')
  double? get windSpeed => throw _privateConstructorUsedError;
  @JsonKey(name: 'clouds')
  int? get clounds => throw _privateConstructorUsedError;
  @JsonKey(name: 'rain')
  double? get rain => throw _privateConstructorUsedError;
  @JsonKey(name: 'uvi')
  double? get uvi => throw _privateConstructorUsedError;
  @JsonKey(name: 'sunrise')
  double? get sunrise => throw _privateConstructorUsedError;
  @JsonKey(name: 'sunset')
  double? get sunset => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherDailyModelCopyWith<WeatherDailyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherDailyModelCopyWith<$Res> {
  factory $WeatherDailyModelCopyWith(
          WeatherDailyModel value, $Res Function(WeatherDailyModel) then) =
      _$WeatherDailyModelCopyWithImpl<$Res, WeatherDailyModel>;
  @useResult
  $Res call(
      {String? day,
      String? hour,
      @JsonKey(name: 'weather') List<WeatherAttributeModel>? listStatusWeather,
      @JsonKey(name: 'temp') TemperatureDailyModel? temp,
      @JsonKey(name: 'dt') double? dt,
      @JsonKey(name: 'wind_speed') double? windSpeed,
      @JsonKey(name: 'clouds') int? clounds,
      @JsonKey(name: 'rain') double? rain,
      @JsonKey(name: 'uvi') double? uvi,
      @JsonKey(name: 'sunrise') double? sunrise,
      @JsonKey(name: 'sunset') double? sunset});

  $TemperatureDailyModelCopyWith<$Res>? get temp;
}

/// @nodoc
class _$WeatherDailyModelCopyWithImpl<$Res, $Val extends WeatherDailyModel>
    implements $WeatherDailyModelCopyWith<$Res> {
  _$WeatherDailyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = freezed,
    Object? hour = freezed,
    Object? listStatusWeather = freezed,
    Object? temp = freezed,
    Object? dt = freezed,
    Object? windSpeed = freezed,
    Object? clounds = freezed,
    Object? rain = freezed,
    Object? uvi = freezed,
    Object? sunrise = freezed,
    Object? sunset = freezed,
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
      listStatusWeather: freezed == listStatusWeather
          ? _value.listStatusWeather
          : listStatusWeather // ignore: cast_nullable_to_non_nullable
              as List<WeatherAttributeModel>?,
      temp: freezed == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as TemperatureDailyModel?,
      dt: freezed == dt
          ? _value.dt
          : dt // ignore: cast_nullable_to_non_nullable
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
              as double?,
      uvi: freezed == uvi
          ? _value.uvi
          : uvi // ignore: cast_nullable_to_non_nullable
              as double?,
      sunrise: freezed == sunrise
          ? _value.sunrise
          : sunrise // ignore: cast_nullable_to_non_nullable
              as double?,
      sunset: freezed == sunset
          ? _value.sunset
          : sunset // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TemperatureDailyModelCopyWith<$Res>? get temp {
    if (_value.temp == null) {
      return null;
    }

    return $TemperatureDailyModelCopyWith<$Res>(_value.temp!, (value) {
      return _then(_value.copyWith(temp: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherDailyModelImplCopyWith<$Res>
    implements $WeatherDailyModelCopyWith<$Res> {
  factory _$$WeatherDailyModelImplCopyWith(_$WeatherDailyModelImpl value,
          $Res Function(_$WeatherDailyModelImpl) then) =
      __$$WeatherDailyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? day,
      String? hour,
      @JsonKey(name: 'weather') List<WeatherAttributeModel>? listStatusWeather,
      @JsonKey(name: 'temp') TemperatureDailyModel? temp,
      @JsonKey(name: 'dt') double? dt,
      @JsonKey(name: 'wind_speed') double? windSpeed,
      @JsonKey(name: 'clouds') int? clounds,
      @JsonKey(name: 'rain') double? rain,
      @JsonKey(name: 'uvi') double? uvi,
      @JsonKey(name: 'sunrise') double? sunrise,
      @JsonKey(name: 'sunset') double? sunset});

  @override
  $TemperatureDailyModelCopyWith<$Res>? get temp;
}

/// @nodoc
class __$$WeatherDailyModelImplCopyWithImpl<$Res>
    extends _$WeatherDailyModelCopyWithImpl<$Res, _$WeatherDailyModelImpl>
    implements _$$WeatherDailyModelImplCopyWith<$Res> {
  __$$WeatherDailyModelImplCopyWithImpl(_$WeatherDailyModelImpl _value,
      $Res Function(_$WeatherDailyModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = freezed,
    Object? hour = freezed,
    Object? listStatusWeather = freezed,
    Object? temp = freezed,
    Object? dt = freezed,
    Object? windSpeed = freezed,
    Object? clounds = freezed,
    Object? rain = freezed,
    Object? uvi = freezed,
    Object? sunrise = freezed,
    Object? sunset = freezed,
  }) {
    return _then(_$WeatherDailyModelImpl(
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String?,
      hour: freezed == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as String?,
      listStatusWeather: freezed == listStatusWeather
          ? _value._listStatusWeather
          : listStatusWeather // ignore: cast_nullable_to_non_nullable
              as List<WeatherAttributeModel>?,
      temp: freezed == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as TemperatureDailyModel?,
      dt: freezed == dt
          ? _value.dt
          : dt // ignore: cast_nullable_to_non_nullable
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
              as double?,
      uvi: freezed == uvi
          ? _value.uvi
          : uvi // ignore: cast_nullable_to_non_nullable
              as double?,
      sunrise: freezed == sunrise
          ? _value.sunrise
          : sunrise // ignore: cast_nullable_to_non_nullable
              as double?,
      sunset: freezed == sunset
          ? _value.sunset
          : sunset // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherDailyModelImpl
    with DiagnosticableTreeMixin
    implements _WeatherDailyModel {
  _$WeatherDailyModelImpl(
      {this.day,
      this.hour,
      @JsonKey(name: 'weather')
      final List<WeatherAttributeModel>? listStatusWeather,
      @JsonKey(name: 'temp') this.temp,
      @JsonKey(name: 'dt') this.dt,
      @JsonKey(name: 'wind_speed') this.windSpeed,
      @JsonKey(name: 'clouds') this.clounds,
      @JsonKey(name: 'rain') this.rain,
      @JsonKey(name: 'uvi') this.uvi,
      @JsonKey(name: 'sunrise') this.sunrise,
      @JsonKey(name: 'sunset') this.sunset})
      : _listStatusWeather = listStatusWeather;

  factory _$WeatherDailyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherDailyModelImplFromJson(json);

  @override
  final String? day;
  @override
  final String? hour;
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
  final TemperatureDailyModel? temp;
  @override
  @JsonKey(name: 'dt')
  final double? dt;
  @override
  @JsonKey(name: 'wind_speed')
  final double? windSpeed;
  @override
  @JsonKey(name: 'clouds')
  final int? clounds;
  @override
  @JsonKey(name: 'rain')
  final double? rain;
  @override
  @JsonKey(name: 'uvi')
  final double? uvi;
  @override
  @JsonKey(name: 'sunrise')
  final double? sunrise;
  @override
  @JsonKey(name: 'sunset')
  final double? sunset;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WeatherDailyModel(day: $day, hour: $hour, listStatusWeather: $listStatusWeather, temp: $temp, dt: $dt, windSpeed: $windSpeed, clounds: $clounds, rain: $rain, uvi: $uvi, sunrise: $sunrise, sunset: $sunset)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WeatherDailyModel'))
      ..add(DiagnosticsProperty('day', day))
      ..add(DiagnosticsProperty('hour', hour))
      ..add(DiagnosticsProperty('listStatusWeather', listStatusWeather))
      ..add(DiagnosticsProperty('temp', temp))
      ..add(DiagnosticsProperty('dt', dt))
      ..add(DiagnosticsProperty('windSpeed', windSpeed))
      ..add(DiagnosticsProperty('clounds', clounds))
      ..add(DiagnosticsProperty('rain', rain))
      ..add(DiagnosticsProperty('uvi', uvi))
      ..add(DiagnosticsProperty('sunrise', sunrise))
      ..add(DiagnosticsProperty('sunset', sunset));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherDailyModelImpl &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.hour, hour) || other.hour == hour) &&
            const DeepCollectionEquality()
                .equals(other._listStatusWeather, _listStatusWeather) &&
            (identical(other.temp, temp) || other.temp == temp) &&
            (identical(other.dt, dt) || other.dt == dt) &&
            (identical(other.windSpeed, windSpeed) ||
                other.windSpeed == windSpeed) &&
            (identical(other.clounds, clounds) || other.clounds == clounds) &&
            (identical(other.rain, rain) || other.rain == rain) &&
            (identical(other.uvi, uvi) || other.uvi == uvi) &&
            (identical(other.sunrise, sunrise) || other.sunrise == sunrise) &&
            (identical(other.sunset, sunset) || other.sunset == sunset));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      day,
      hour,
      const DeepCollectionEquality().hash(_listStatusWeather),
      temp,
      dt,
      windSpeed,
      clounds,
      rain,
      uvi,
      sunrise,
      sunset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherDailyModelImplCopyWith<_$WeatherDailyModelImpl> get copyWith =>
      __$$WeatherDailyModelImplCopyWithImpl<_$WeatherDailyModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherDailyModelImplToJson(
      this,
    );
  }
}

abstract class _WeatherDailyModel implements WeatherDailyModel {
  factory _WeatherDailyModel(
      {final String? day,
      final String? hour,
      @JsonKey(name: 'weather')
      final List<WeatherAttributeModel>? listStatusWeather,
      @JsonKey(name: 'temp') final TemperatureDailyModel? temp,
      @JsonKey(name: 'dt') final double? dt,
      @JsonKey(name: 'wind_speed') final double? windSpeed,
      @JsonKey(name: 'clouds') final int? clounds,
      @JsonKey(name: 'rain') final double? rain,
      @JsonKey(name: 'uvi') final double? uvi,
      @JsonKey(name: 'sunrise') final double? sunrise,
      @JsonKey(name: 'sunset') final double? sunset}) = _$WeatherDailyModelImpl;

  factory _WeatherDailyModel.fromJson(Map<String, dynamic> json) =
      _$WeatherDailyModelImpl.fromJson;

  @override
  String? get day;
  @override
  String? get hour;
  @override
  @JsonKey(name: 'weather')
  List<WeatherAttributeModel>? get listStatusWeather;
  @override
  @JsonKey(name: 'temp')
  TemperatureDailyModel? get temp;
  @override
  @JsonKey(name: 'dt')
  double? get dt;
  @override
  @JsonKey(name: 'wind_speed')
  double? get windSpeed;
  @override
  @JsonKey(name: 'clouds')
  int? get clounds;
  @override
  @JsonKey(name: 'rain')
  double? get rain;
  @override
  @JsonKey(name: 'uvi')
  double? get uvi;
  @override
  @JsonKey(name: 'sunrise')
  double? get sunrise;
  @override
  @JsonKey(name: 'sunset')
  double? get sunset;
  @override
  @JsonKey(ignore: true)
  _$$WeatherDailyModelImplCopyWith<_$WeatherDailyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
