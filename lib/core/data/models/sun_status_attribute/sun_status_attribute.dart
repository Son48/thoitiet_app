import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'sun_status_attribute.freezed.dart';
part 'sun_status_attribute.g.dart';

@freezed
class SunModel with _$SunModel {
  factory SunModel({
    @JsonKey(name: 'sunrise') String? sunRise,
    @JsonKey(name: 'sunset') String? sunSet,
  }) = _SunModel;
  factory SunModel.fromJson(Map<String, Object?> json) =>
      _$SunModelFromJson(json);
}
