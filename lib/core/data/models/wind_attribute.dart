import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'wind_attribute.freezed.dart';
part 'wind_attribute.g.dart';

@freezed
class WindModel with _$WindModel {
  factory WindModel({
    @JsonKey(name: 'speed') double? speed,
    @JsonKey(name: 'deg') double? deg,
    @JsonKey(name: 'gust') double? gust,
  }) = _WindModel;
  factory WindModel.fromJson(Map<String, Object?> json) =>
      _$WindModelFromJson(json);
}
