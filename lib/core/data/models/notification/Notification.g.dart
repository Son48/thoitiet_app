// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationModelImpl(
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      hour: json['hour'] as int?,
      minute: json['minute'] as int?,
      nameLocation: json['nameLocation'] as String?,
      year: json['year'] as int?,
      alert: json['alert'] as String?,
      dateTime: json['dtCurrent'] as String?,
      urlIcon: json['urlIcon'] as String?,
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'hour': instance.hour,
      'minute': instance.minute,
      'nameLocation': instance.nameLocation,
      'year': instance.year,
      'alert': instance.alert,
      'dtCurrent': instance.dateTime,
      'urlIcon': instance.urlIcon,
    };
