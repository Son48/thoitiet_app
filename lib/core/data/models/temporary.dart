import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'temporary.freezed.dart';
part 'temporary.g.dart';

@freezed
class TemporaryModel with _$TemporaryModel {
  factory TemporaryModel({
    @JsonKey(name: 'temp') String? temp,
    @JsonKey(name: 'feels_like') String? feelsLike,
    @JsonKey(name: 'temp_min') String? tempMin,
    @JsonKey(name: 'temp_max') String? temmMax,
  }) = _TemporaryModel;
  factory TemporaryModel.fromJson(Map<String, Object?> json) =>
      _$TemporaryModelFromJson(json);
}
