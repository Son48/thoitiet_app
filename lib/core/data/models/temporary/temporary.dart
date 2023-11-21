import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'temporary.freezed.dart';
part 'temporary.g.dart';

@freezed
class TemporaryModel with _$TemporaryModel {
  factory TemporaryModel({
    @JsonKey(name: 'temp') double? temp,
    @JsonKey(name: 'feels_like') double? feelsLike,
    @JsonKey(name: 'temp_min') double? tempMin,
    @JsonKey(name: 'temp_max') double? temmMax,
  }) = _TemporaryModel;
  factory TemporaryModel.fromJson(Map<String, Object?> json) =>
      _$TemporaryModelFromJson(json);
}
