// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wind_attribute.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WindModelImpl _$$WindModelImplFromJson(Map<String, dynamic> json) =>
    _$WindModelImpl(
      speed: json['speed'] as String?,
      deg: json['deg'] as String?,
      gust: json['gust'] as String?,
    );

Map<String, dynamic> _$$WindModelImplToJson(_$WindModelImpl instance) =>
    <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
      'gust': instance.gust,
    };
