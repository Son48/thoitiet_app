// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_countries.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StateCountriesModelImpl _$$StateCountriesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StateCountriesModelImpl(
      stateContries: json['stateCountry'] as String?,
      locations: (json['locations'] as List<dynamic>?)
          ?.map((e) => LocationJSONModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StateCountriesModelImplToJson(
        _$StateCountriesModelImpl instance) =>
    <String, dynamic>{
      'stateCountry': instance.stateContries,
      'locations': instance.locations,
    };
