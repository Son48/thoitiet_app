// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherModelImpl _$$WeatherModelImplFromJson(Map<String, dynamic> json) =>
    _$WeatherModelImpl(
      lon: json['lon'] as String?,
      lat: json['lat'] as String?,
      day: json['day'] as String?,
      hour: json['hour'] as String?,
      listStatusWeather: (json['weather'] as List<dynamic>?)
          ?.map(
              (e) => WeatherAttributeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      nameLocation: json['name'] as String?,
      temporary: json['main'] == null
          ? null
          : TemporaryModel.fromJson(json['main'] as Map<String, dynamic>),
      clounds: json['clouds'] == null
          ? null
          : CloundModel.fromJson(json['clouds'] as Map<String, dynamic>),
      winds: json['wind'] == null
          ? null
          : WindModel.fromJson(json['wind'] as Map<String, dynamic>),
      sun: json['sun'] == null
          ? null
          : SunModel.fromJson(json['sun'] as Map<String, dynamic>),
      rain: json['rain'] as String?,
    );

Map<String, dynamic> _$$WeatherModelImplToJson(_$WeatherModelImpl instance) =>
    <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
      'day': instance.day,
      'hour': instance.hour,
      'weather': instance.listStatusWeather,
      'name': instance.nameLocation,
      'main': instance.temporary,
      'clouds': instance.clounds,
      'wind': instance.winds,
      'sun': instance.sun,
      'rain': instance.rain,
    };
