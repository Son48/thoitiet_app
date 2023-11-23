// import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
class LocationModel with _$LocationModel {
  factory LocationModel({
    @JsonKey(name: 'lat') double? lat,
    @JsonKey(name: 'lon') double? lon,
    @JsonKey(name: 'nameLocation') String? nameLocation,
  }) = _LocationModel;
  factory LocationModel.fromJson(Map<String, Object?> json) =>
      _$LocationModelFromJson(json);
}

// class Location {
//   String? lon;
//   String? lat;
//   String? nameLocation;
//   Location({this.lon, this.lat, this.nameLocation});

//   factory Location.mapSQLtoModel(Map<String, dynamic> map) => Location(
//       lat: map['lat'].toString(),
//       lon: map['lon'].toString(),
//       nameLocation: map['nameLocation']);

//   factory Location.mapJSONtoModel(Map<String, dynamic> map) => Location(
//       lat: map['coord']['lat'].toString(),
//       lon: map['coord']['lon'].toString(),
//       nameLocation: map['name']);
// }
