import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:thoitiet_app/core/data/models/coord_attribute/coord_attribute.dart';

part 'locationJSON.freezed.dart';
part 'locationJSON.g.dart';

@freezed
class LocationJSONModel with _$LocationJSONModel {
  factory LocationJSONModel({
    @JsonKey(name: 'name') String? nameLocation,
    @JsonKey(name: 'coord') CoordModel? coord,
  }) = _LocationJSONModel;
  factory LocationJSONModel.fromJson(Map<String, Object?> json) =>
      _$LocationJSONModelFromJson(json);
}
