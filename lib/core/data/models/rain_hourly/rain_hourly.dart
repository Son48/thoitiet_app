import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'rain_hourly.freezed.dart';
part 'rain_hourly.g.dart';

@freezed
class RainHourlyModel with _$RainHourlyModel {
  factory RainHourlyModel({
    @JsonKey(name: '1h') double? rain,
  }) = _RainHourlyModel;
  factory RainHourlyModel.fromJson(Map<String, Object?> json) =>
      _$RainHourlyModelFromJson(json);
}
