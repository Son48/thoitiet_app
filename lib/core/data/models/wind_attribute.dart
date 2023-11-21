import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'wind_attribute.freezed.dart';
part 'wind_attribute.g.dart';

@freezed
class WindModel with _$WindModel {
  factory WindModel({
    @JsonKey(name: 'speed') String? speed,
    @JsonKey(name: 'deg') String? deg,
    @JsonKey(name: 'gust') String? gust,
  }) = _WindModel;
  factory WindModel.fromJson(Map<String, Object?> json) =>
      _$WindModelFromJson(json);
}
