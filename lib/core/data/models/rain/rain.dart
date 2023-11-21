import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'rain.freezed.dart';
part 'rain.g.dart';

@freezed
class RainModel with _$RainModel {
  factory RainModel({
    @JsonKey(name: 'rain') String? rain,
  }) = _RainModel;
  factory RainModel.fromJson(Map<String, Object?> json) =>
      _$RainModelFromJson(json);
}
