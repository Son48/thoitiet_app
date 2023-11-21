// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature_daily.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TemperatureDailyModelImpl _$$TemperatureDailyModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TemperatureDailyModelImpl(
      tempDay: (json['day'] as num?)?.toDouble(),
      tempMin: (json['min'] as num?)?.toDouble(),
      tempMax: (json['max'] as num?)?.toDouble(),
      temmNight: (json['night'] as num?)?.toDouble(),
      temmEvening: (json['eve'] as num?)?.toDouble(),
      temmMorning: (json['morn'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$TemperatureDailyModelImplToJson(
        _$TemperatureDailyModelImpl instance) =>
    <String, dynamic>{
      'day': instance.tempDay,
      'min': instance.tempMin,
      'max': instance.tempMax,
      'night': instance.temmNight,
      'eve': instance.temmEvening,
      'morn': instance.temmMorning,
    };
