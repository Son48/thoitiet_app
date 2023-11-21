// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rain_hourly.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RainHourlyModelImpl _$$RainHourlyModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RainHourlyModelImpl(
      rain: (json['1h'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$RainHourlyModelImplToJson(
        _$RainHourlyModelImpl instance) =>
    <String, dynamic>{
      '1h': instance.rain,
    };
