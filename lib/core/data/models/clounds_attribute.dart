import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'clounds_attribute.freezed.dart';
part 'clounds_attribute.g.dart';

@freezed
class CloundModel with _$CloundModel {
  factory CloundModel({
    @JsonKey(name: 'all') String? clounds,
  }) = _CloundModel;
  factory CloundModel.fromJson(Map<String, Object?> json) =>
      _$CloundModelFromJson(json);
}
