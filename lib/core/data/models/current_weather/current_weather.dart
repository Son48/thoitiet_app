import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:thoitiet_app/core/data/models/weather_attribute/weather_attribute.dart';

part 'current_weather.freezed.dart';
part 'current_weather.g.dart';

@freezed
class CurrentWeather with _$CurrentWeather {
  factory CurrentWeather({
    @JsonKey(name: 'sunrise') int? sunrise,
    @JsonKey(name: 'sunset') int? sunset,
    @JsonKey(name: 'temp') double? temp,
    @JsonKey(name: 'feels_like') double? feels_like,
    @JsonKey(name: 'uvi') double? uvi,
    @JsonKey(name: 'clouds') int? clouds,
    @JsonKey(name: 'visibility') double? visibility,
    @JsonKey(name: 'wind_speed') double? wind_speed,
    @JsonKey(name: 'weather') List<WeatherAttributeModel>? listStatusWeather,
  }) = _CurrentWeather;
  factory CurrentWeather.fromJson(Map<String, Object?> json) =>
      _$CurrentWeatherFromJson(json);
}
