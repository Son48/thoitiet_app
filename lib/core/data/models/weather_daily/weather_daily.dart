import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:thoitiet_app/core/data/models/temperature_daily/temperature_daily.dart';
import 'package:thoitiet_app/core/data/models/weather_attribute/weather_attribute.dart';
part 'weather_daily.freezed.dart';
part 'weather_daily.g.dart';

@freezed
class WeatherDailyModel with _$WeatherDailyModel {
  factory WeatherDailyModel({
    String? day,
    String? hour,
    @JsonKey(name: 'weather') List<WeatherAttributeModel>? listStatusWeather,
    @JsonKey(name: 'temp') TemperatureDailyModel? temp,
    @JsonKey(name: 'dt') double? dt,
    @JsonKey(name: 'wind_speed') double? windSpeed,
    @JsonKey(name: 'clouds') int? clounds,
    @JsonKey(name: 'rain') double? rain,
    @JsonKey(name: 'uvi') double? uvi,
    @JsonKey(name: 'sunrise') double? sunrise,
    @JsonKey(name: 'sunset') double? sunset,
  }) = _WeatherDailyModel;
  factory WeatherDailyModel.fromJson(Map<String, Object?> json) =>
      _$WeatherDailyModelFromJson(json).copyWith(
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
