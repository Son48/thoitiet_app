// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_daily.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherDailyModelImpl _$$WeatherDailyModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WeatherDailyModelImpl(
      day: json['day'] as String?,
      hour: json['hour'] as String?,
      listStatusWeather: (json['weather'] as List<dynamic>?)
          ?.map(
              (e) => WeatherAttributeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      temp: json['temp'] == null
          ? null
          : TemperatureDailyModel.fromJson(
              json['temp'] as Map<String, dynamic>),
      dt: (json['dt'] as num?)?.toDouble(),
      windSpeed: (json['wind_speed'] as num?)?.toDouble(),
      clounds: json['clouds'] as int?,
      rain: (json['rain'] as num?)?.toDouble(),
      uvi: (json['uvi'] as num?)?.toDouble(),
      sunrise: (json['sunrise'] as num?)?.toDouble(),
      sunset: (json['sunset'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$WeatherDailyModelImplToJson(
        _$WeatherDailyModelImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'hour': instance.hour,
      'weather': instance.listStatusWeather,
      'temp': instance.temp,
      'dt': instance.dt,
      'wind_speed': instance.windSpeed,
      'clouds': instance.clounds,
      'rain': instance.rain,
      'uvi': instance.uvi,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
