import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'temperature_daily.freezed.dart';
part 'temperature_daily.g.dart';

@freezed
class TemperatureDailyModel with _$TemperatureDailyModel {
  factory TemperatureDailyModel({
    @JsonKey(name: 'day') double? tempDay,
    @JsonKey(name: 'min') double? tempMin,
    @JsonKey(name: 'max') double? tempMax,
    @JsonKey(name: 'night') double? temmNight,
    @JsonKey(name: 'eve') double? temmEvening,
    @JsonKey(name: 'morn') double? temmMorning,
  }) = _TemperatureDailyModel;
  factory TemperatureDailyModel.fromJson(Map<String, Object?> json) =>
      _$TemperatureDailyModelFromJson(json);
}
