// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_hourly.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherHourlyModelImpl _$$WeatherHourlyModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WeatherHourlyModelImpl(
      day: json['day'] as String?,
      hour: json['hour'] as String?,
      dt: (json['dt'] as num?)?.toDouble(),
      listStatusWeather: (json['weather'] as List<dynamic>?)
          ?.map(
              (e) => WeatherAttributeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      temp: (json['temp'] as num?)?.toDouble(),
      windSpeed: (json['wind_speed'] as num?)?.toDouble(),
      clounds: json['clouds'] as int?,
      rain: json['rain'] == null
          ? null
          : RainHourlyModel.fromJson(json['rain'] as Map<String, dynamic>),
      uvi: (json['uvi'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$WeatherHourlyModelImplToJson(
        _$WeatherHourlyModelImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'hour': instance.hour,
      'dt': instance.dt,
      'weather': instance.listStatusWeather,
      'temp': instance.temp,
      'wind_speed': instance.windSpeed,
      'clouds': instance.clounds,
      'rain': instance.rain,
      'uvi': instance.uvi,
    };
