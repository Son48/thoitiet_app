// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forest_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForestWeatherModelImpl _$$ForestWeatherModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ForestWeatherModelImpl(
      daily: (json['daily'] as List<dynamic>?)
          ?.map((e) => WeatherModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      hourly: (json['hourly'] as List<dynamic>?)
          ?.map((e) => WeatherModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      moreAttribute: json['current'] == null
          ? null
          : MoreAttributeModel.fromJson(
              json['current'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ForestWeatherModelImplToJson(
        _$ForestWeatherModelImpl instance) =>
    <String, dynamic>{
      'daily': instance.daily,
      'hourly': instance.hourly,
      'current': instance.moreAttribute,
    };
