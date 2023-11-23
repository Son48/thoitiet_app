// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locationJSON.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationJSONModelImpl _$$LocationJSONModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LocationJSONModelImpl(
      nameLocation: json['name'] as String?,
      coord: json['coord'] == null
          ? null
          : CoordModel.fromJson(json['coord'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LocationJSONModelImplToJson(
        _$LocationJSONModelImpl instance) =>
    <String, dynamic>{
      'name': instance.nameLocation,
      'coord': instance.coord,
    };
