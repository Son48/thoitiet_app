// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_notifi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingNotificationModelImpl _$$SettingNotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SettingNotificationModelImpl(
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      hour: json['hour'] as int?,
      minute: json['minute'] as int?,
      nameLocation: json['nameLocation'] as String?,
    );

Map<String, dynamic> _$$SettingNotificationModelImplToJson(
        _$SettingNotificationModelImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'hour': instance.hour,
      'minute': instance.minute,
      'nameLocation': instance.nameLocation,
    };
