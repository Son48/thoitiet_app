// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temporary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TemporaryModelImpl _$$TemporaryModelImplFromJson(Map<String, dynamic> json) =>
    _$TemporaryModelImpl(
      temp: (json['temp'] as num?)?.toDouble(),
      feelsLike: (json['feels_like'] as num?)?.toDouble(),
      tempMin: (json['temp_min'] as num?)?.toDouble(),
      temmMax: (json['temp_max'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$TemporaryModelImplToJson(
        _$TemporaryModelImpl instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.temmMax,
    };
