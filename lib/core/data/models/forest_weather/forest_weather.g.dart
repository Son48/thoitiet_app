// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forest_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForestWeatherModelImpl _$$ForestWeatherModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ForestWeatherModelImpl(
      daily: (json['daily'] as List<dynamic>?)
          ?.map((e) => WeatherDailyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      hourly: (json['hourly'] as List<dynamic>?)
          ?.map((e) => WeatherHourlyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentWeather: json['current'] == null
          ? null
          : CurrentWeather.fromJson(json['current'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ForestWeatherModelImplToJson(
        _$ForestWeatherModelImpl instance) =>
    <String, dynamic>{
      'daily': instance.daily,
      'hourly': instance.hourly,
      'current': instance.currentWeather,
    };
