// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_attribute.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherAttributeModelImpl _$$WeatherAttributeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WeatherAttributeModelImpl(
      idWeatherAttribute: json['id'] as String?,
      mainWeatherAttribute: json['main'] as String?,
      desWeatherAttribute: json['description'] as String?,
      urlStatusIcon: json['icon'] as String?,
    );

Map<String, dynamic> _$$WeatherAttributeModelImplToJson(
        _$WeatherAttributeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.idWeatherAttribute,
      'main': instance.mainWeatherAttribute,
      'description': instance.desWeatherAttribute,
      'icon': instance.urlStatusIcon,
    };
