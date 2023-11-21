import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:thoitiet_app/core/data/models/rain_hourly/rain_hourly.dart';
import 'package:thoitiet_app/core/data/models/weather_attribute/weather_attribute.dart';
part 'weather_hourly.freezed.dart';
part 'weather_hourly.g.dart';

@freezed
class WeatherHourlyModel with _$WeatherHourlyModel {
  factory WeatherHourlyModel({
    String? day,
    String? hour,
    @JsonKey(name: 'dt') double? dt,
    @JsonKey(name: 'weather') List<WeatherAttributeModel>? listStatusWeather,
    @JsonKey(name: 'temp') double? temp,
    @JsonKey(name: 'wind_speed') double? windSpeed,
    @JsonKey(name: 'clouds') int? clounds,
    @JsonKey(name: 'rain') RainHourlyModel? rain,
    @JsonKey(name: 'uvi') double? uvi,
  }) = _WeatherHourlyModel;
  factory WeatherHourlyModel.fromJson(Map<String, Object?> json) =>
      _$WeatherHourlyModelFromJson(json).copyWith(
          day: convertDaysToDateTime(int.parse(json['dt'].toString()), 0),
          hour: convertDaysToDateTime(int.parse(json['dt'].toString()), 1));

  static String convertDaysToDateTime(int days, int choose) {
    final dt = DateTime.fromMillisecondsSinceEpoch(days * 1000);
    DateFormat timeFormat = DateFormat('HH:mm');
    String formattedTime = timeFormat.format(dt);

    DateFormat dateFormat = DateFormat('dd/MM');
    String formattedDate = dateFormat.format(dt);
    if (choose == 0) {
      return formattedDate.toString();
    } else {
      return formattedTime.toString();
    }
  }
}
