import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'Notification.freezed.dart';
part 'Notification.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  factory NotificationModel({
    @JsonKey(name: 'lat') double? lat,
    @JsonKey(name: 'lon') double? lon,
    @JsonKey(name: 'hour') int? hour,
    @JsonKey(name: 'minute') int? minute,
    @JsonKey(name: 'nameLocation') String? nameLocation,
    @JsonKey(name: 'year') int? year,
    @JsonKey(name: 'alert') String? alert,
    @JsonKey(name: 'dtCurrent') String? dateTime,
    @JsonKey(name: 'urlIcon') String? urlIcon,
  }) = _NotificationModel;
  factory NotificationModel.fromJson(Map<String, Object?> json) =>
      _$NotificationModelFromJson(json);
}
