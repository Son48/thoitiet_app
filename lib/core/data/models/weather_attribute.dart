import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'weather_attribute.freezed.dart';
part 'weather_attribute.g.dart';

@freezed
class WeatherAttributeModel with _$WeatherAttributeModel {
  factory WeatherAttributeModel({
    @JsonKey(name: 'id') String? idWeatherAttribute,
    @JsonKey(name: 'main') String? mainWeatherAttribute,
    @JsonKey(name: 'description') String? desWeatherAttribute,
    @JsonKey(name: 'icon') String? urlStatusIcon,
  }) = _WeatherAttributeModel;
  factory WeatherAttributeModel.fromJson(Map<String, Object?> json) =>
      _$WeatherAttributeModelFromJson(json);
}
