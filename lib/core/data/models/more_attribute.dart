import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'more_attribute.freezed.dart';
part 'more_attribute.g.dart';

@freezed
class MoreAttributeModel with _$MoreAttributeModel {
  factory MoreAttributeModel({
    @JsonKey(name: 'visibility') String? visibility,
    @JsonKey(name: 'uvi') String? uvi,
  }) = _MoreAttributeModel;
  factory MoreAttributeModel.fromJson(Map<String, Object?> json) =>
      _$MoreAttributeModelFromJson(json);
}
