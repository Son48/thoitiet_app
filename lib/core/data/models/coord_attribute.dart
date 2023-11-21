import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'coord_attribute.freezed.dart';
part 'coord_attribute.g.dart';

@freezed
class CoordModel with _$CoordModel {
  factory CoordModel({
    @JsonKey(name: 'lon') double? lon,
    @JsonKey(name: 'lat') double? lat,
  }) = _CoordModel;
  factory CoordModel.fromJson(Map<String, Object?> json) =>
      _$CoordModelFromJson(json);
}
