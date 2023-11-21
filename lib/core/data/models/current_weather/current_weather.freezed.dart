// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) {
  return _CurrentWeather.fromJson(json);
}

/// @nodoc
mixin _$CurrentWeather {
  @JsonKey(name: 'sunrise')
  int? get sunrise => throw _privateConstructorUsedError;
  @JsonKey(name: 'sunset')
  int? get sunset => throw _privateConstructorUsedError;
  @JsonKey(name: 'temp')
  double? get temp => throw _privateConstructorUsedError;
  @JsonKey(name: 'feels_like')
  double? get feels_like => throw _privateConstructorUsedError;
  @JsonKey(name: 'uvi')
  double? get uvi => throw _privateConstructorUsedError;
  @JsonKey(name: 'clouds')
  int? get clouds => throw _privateConstructorUsedError;
  @JsonKey(name: 'visibility')
  double? get visibility => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_speed')
  double? get wind_speed => throw _privateConstructorUsedError;
  @JsonKey(name: 'weather')
  List<WeatherAttributeModel>? get listStatusWeather =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrentWeatherCopyWith<CurrentWeather> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentWeatherCopyWith<$Res> {
  factory $CurrentWeatherCopyWith(
          CurrentWeather value, $Res Function(CurrentWeather) then) =
      _$CurrentWeatherCopyWithImpl<$Res, CurrentWeather>;
  @useResult
  $Res call(
      {@JsonKey(name: 'sunrise') int? sunrise,
      @JsonKey(name: 'sunset') int? sunset,
      @JsonKey(name: 'temp') double? temp,
      @JsonKey(name: 'feels_like') double? feels_like,
      @JsonKey(name: 'uvi') double? uvi,
      @JsonKey(name: 'clouds') int? clouds,
      @JsonKey(name: 'visibility') double? visibility,
      @JsonKey(name: 'wind_speed') double? wind_speed,
      @JsonKey(name: 'weather')
      List<WeatherAttributeModel>? listStatusWeather});
}

/// @nodoc
class _$CurrentWeatherCopyWithImpl<$Res, $Val extends CurrentWeather>
    implements $CurrentWeatherCopyWith<$Res> {
  _$CurrentWeatherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sunrise = freezed,
    Object? sunset = freezed,
    Object? temp = freezed,
    Object? feels_like = freezed,
    Object? uvi = freezed,
    Object? clouds = freezed,
    Object? visibility = freezed,
    Object? wind_speed = freezed,
    Object? listStatusWeather = freezed,
  }) {
    return _then(_value.copyWith(
      sunrise: freezed == sunrise
          ? _value.sunrise
          : sunrise // ignore: cast_nullable_to_non_nullable
              as int?,
      sunset: freezed == sunset
          ? _value.sunset
          : sunset // ignore: cast_nullable_to_non_nullable
              as int?,
      temp: freezed == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as double?,
      feels_like: freezed == feels_like
          ? _value.feels_like
          : feels_like // ignore: cast_nullable_to_non_nullable
              as double?,
      uvi: freezed == uvi
          ? _value.uvi
          : uvi // ignore: cast_nullable_to_non_nullable
              as double?,
      clouds: freezed == clouds
          ? _value.clouds
          : clouds // ignore: cast_nullable_to_non_nullable
              as int?,
      visibility: freezed == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as double?,
      wind_speed: freezed == wind_speed
          ? _value.wind_speed
          : wind_speed // ignore: cast_nullable_to_non_nullable
              as double?,
      listStatusWeather: freezed == listStatusWeather
          ? _value.listStatusWeather
          : listStatusWeather // ignore: cast_nullable_to_non_nullable
              as List<WeatherAttributeModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrentWeatherImplCopyWith<$Res>
    implements $CurrentWeatherCopyWith<$Res> {
  factory _$$CurrentWeatherImplCopyWith(_$CurrentWeatherImpl value,
          $Res Function(_$CurrentWeatherImpl) then) =
      __$$CurrentWeatherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'sunrise') int? sunrise,
      @JsonKey(name: 'sunset') int? sunset,
      @JsonKey(name: 'temp') double? temp,
      @JsonKey(name: 'feels_like') double? feels_like,
      @JsonKey(name: 'uvi') double? uvi,
      @JsonKey(name: 'clouds') int? clouds,
      @JsonKey(name: 'visibility') double? visibility,
      @JsonKey(name: 'wind_speed') double? wind_speed,
      @JsonKey(name: 'weather')
      List<WeatherAttributeModel>? listStatusWeather});
}

/// @nodoc
class __$$CurrentWeatherImplCopyWithImpl<$Res>
    extends _$CurrentWeatherCopyWithImpl<$Res, _$CurrentWeatherImpl>
    implements _$$CurrentWeatherImplCopyWith<$Res> {
  __$$CurrentWeatherImplCopyWithImpl(
      _$CurrentWeatherImpl _value, $Res Function(_$CurrentWeatherImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sunrise = freezed,
    Object? sunset = freezed,
    Object? temp = freezed,
    Object? feels_like = freezed,
    Object? uvi = freezed,
    Object? clouds = freezed,
    Object? visibility = freezed,
    Object? wind_speed = freezed,
    Object? listStatusWeather = freezed,
  }) {
    return _then(_$CurrentWeatherImpl(
      sunrise: freezed == sunrise
          ? _value.sunrise
          : sunrise // ignore: cast_nullable_to_non_nullable
              as int?,
      sunset: freezed == sunset
          ? _value.sunset
          : sunset // ignore: cast_nullable_to_non_nullable
              as int?,
      temp: freezed == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as double?,
      feels_like: freezed == feels_like
          ? _value.feels_like
          : feels_like // ignore: cast_nullable_to_non_nullable
              as double?,
      uvi: freezed == uvi
          ? _value.uvi
          : uvi // ignore: cast_nullable_to_non_nullable
              as double?,
      clouds: freezed == clouds
          ? _value.clouds
          : clouds // ignore: cast_nullable_to_non_nullable
              as int?,
      visibility: freezed == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as double?,
      wind_speed: freezed == wind_speed
          ? _value.wind_speed
          : wind_speed // ignore: cast_nullable_to_non_nullable
              as double?,
      listStatusWeather: freezed == listStatusWeather
          ? _value._listStatusWeather
          : listStatusWeather // ignore: cast_nullable_to_non_nullable
              as List<WeatherAttributeModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrentWeatherImpl
    with DiagnosticableTreeMixin
    implements _CurrentWeather {
  _$CurrentWeatherImpl(
      {@JsonKey(name: 'sunrise') this.sunrise,
      @JsonKey(name: 'sunset') this.sunset,
      @JsonKey(name: 'temp') this.temp,
      @JsonKey(name: 'feels_like') this.feels_like,
      @JsonKey(name: 'uvi') this.uvi,
      @JsonKey(name: 'clouds') this.clouds,
      @JsonKey(name: 'visibility') this.visibility,
      @JsonKey(name: 'wind_speed') this.wind_speed,
      @JsonKey(name: 'weather')
      final List<WeatherAttributeModel>? listStatusWeather})
      : _listStatusWeather = listStatusWeather;

  factory _$CurrentWeatherImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrentWeatherImplFromJson(json);

  @override
  @JsonKey(name: 'sunrise')
  final int? sunrise;
  @override
  @JsonKey(name: 'sunset')
  final int? sunset;
  @override
  @JsonKey(name: 'temp')
  final double? temp;
  @override
  @JsonKey(name: 'feels_like')
  final double? feels_like;
  @override
  @JsonKey(name: 'uvi')
  final double? uvi;
  @override
  @JsonKey(name: 'clouds')
  final int? clouds;
  @override
  @JsonKey(name: 'visibility')
  final double? visibility;
  @override
  @JsonKey(name: 'wind_speed')
  final double? wind_speed;
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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CurrentWeather(sunrise: $sunrise, sunset: $sunset, temp: $temp, feels_like: $feels_like, uvi: $uvi, clouds: $clouds, visibility: $visibility, wind_speed: $wind_speed, listStatusWeather: $listStatusWeather)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CurrentWeather'))
      ..add(DiagnosticsProperty('sunrise', sunrise))
      ..add(DiagnosticsProperty('sunset', sunset))
      ..add(DiagnosticsProperty('temp', temp))
      ..add(DiagnosticsProperty('feels_like', feels_like))
      ..add(DiagnosticsProperty('uvi', uvi))
      ..add(DiagnosticsProperty('clouds', clouds))
      ..add(DiagnosticsProperty('visibility', visibility))
      ..add(DiagnosticsProperty('wind_speed', wind_speed))
      ..add(DiagnosticsProperty('listStatusWeather', listStatusWeather));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentWeatherImpl &&
            (identical(other.sunrise, sunrise) || other.sunrise == sunrise) &&
            (identical(other.sunset, sunset) || other.sunset == sunset) &&
            (identical(other.temp, temp) || other.temp == temp) &&
            (identical(other.feels_like, feels_like) ||
                other.feels_like == feels_like) &&
            (identical(other.uvi, uvi) || other.uvi == uvi) &&
            (identical(other.clouds, clouds) || other.clouds == clouds) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.wind_speed, wind_speed) ||
                other.wind_speed == wind_speed) &&
            const DeepCollectionEquality()
                .equals(other._listStatusWeather, _listStatusWeather));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sunrise,
      sunset,
      temp,
      feels_like,
      uvi,
      clouds,
      visibility,
      wind_speed,
      const DeepCollectionEquality().hash(_listStatusWeather));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentWeatherImplCopyWith<_$CurrentWeatherImpl> get copyWith =>
      __$$CurrentWeatherImplCopyWithImpl<_$CurrentWeatherImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrentWeatherImplToJson(
      this,
    );
  }
}

abstract class _CurrentWeather implements CurrentWeather {
  factory _CurrentWeather(
          {@JsonKey(name: 'sunrise') final int? sunrise,
          @JsonKey(name: 'sunset') final int? sunset,
          @JsonKey(name: 'temp') final double? temp,
          @JsonKey(name: 'feels_like') final double? feels_like,
          @JsonKey(name: 'uvi') final double? uvi,
          @JsonKey(name: 'clouds') final int? clouds,
          @JsonKey(name: 'visibility') final double? visibility,
          @JsonKey(name: 'wind_speed') final double? wind_speed,
          @JsonKey(name: 'weather')
          final List<WeatherAttributeModel>? listStatusWeather}) =
      _$CurrentWeatherImpl;

  factory _CurrentWeather.fromJson(Map<String, dynamic> json) =
      _$CurrentWeatherImpl.fromJson;

  @override
  @JsonKey(name: 'sunrise')
  int? get sunrise;
  @override
  @JsonKey(name: 'sunset')
  int? get sunset;
  @override
  @JsonKey(name: 'temp')
  double? get temp;
  @override
  @JsonKey(name: 'feels_like')
  double? get feels_like;
  @override
  @JsonKey(name: 'uvi')
  double? get uvi;
  @override
  @JsonKey(name: 'clouds')
  int? get clouds;
  @override
  @JsonKey(name: 'visibility')
  double? get visibility;
  @override
  @JsonKey(name: 'wind_speed')
  double? get wind_speed;
  @override
  @JsonKey(name: 'weather')
  List<WeatherAttributeModel>? get listStatusWeather;
  @override
  @JsonKey(ignore: true)
  _$$CurrentWeatherImplCopyWith<_$CurrentWeatherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
