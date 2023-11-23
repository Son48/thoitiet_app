import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'setting_notifi.freezed.dart';
part 'setting_notifi.g.dart';

@freezed
class SettingNotificationModel with _$SettingNotificationModel {
  factory SettingNotificationModel({
    @JsonKey(name: 'lat') double? lat,
    @JsonKey(name: 'lon') double? lon,
    @JsonKey(name: 'hour') int? hour,
    @JsonKey(name: 'minute') int? minute,
    @JsonKey(name: 'nameLocation') String? nameLocation,
  }) = _SettingNotificationModel;
  factory SettingNotificationModel.fromJson(Map<String, Object?> json) =>
      _$SettingNotificationModelFromJson(json);
}
