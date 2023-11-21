import 'package:thoitiet_app/core/data/models/current_weather.dart';
import 'package:thoitiet_app/core/data/models/more_attribute.dart';
import 'package:thoitiet_app/core/data/models/rain.dart';
import 'package:thoitiet_app/core/data/models/weather.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'forest_weather.freezed.dart';
part 'forest_weather.g.dart';

@freezed
class ForestWeatherModel with _$ForestWeatherModel {
  factory ForestWeatherModel({
    @JsonKey(name: 'daily') List<WeatherModel>? daily,
    @JsonKey(name: 'hourly') List<WeatherModel>? hourly,
    @JsonKey(name: 'current') CurrentWeather? currentWeather,
  }) = _ForestWeatherModel;
  factory ForestWeatherModel.fromJson(Map<String, Object?> json) =>
      _$ForestWeatherModelFromJson(json);
}


// class ForestWeatherModel {
//   WeatherModel? currentWeather;
//   List<WeatherModel> daily;
//   List<WeatherModel> hourly;

//   ForestWeatherModel({
//     required this.daily,
//     required this.hourly,
//     this.currentWeather,
//   });

//   static Future<ForestWeatherModel> fromJson(
//       Map<String, dynamic> json, WeatherModel w) async {
//     List<WeatherModel> arr_daily = [];
//     List<WeatherModel> arr_hourly = [];
//     w.uvi = json['current']['uvi'].toString();
//     w.visibility = json['current']['visibility'].toString();
//     w.rain = json['daily'][0]['rain'] != null ? json['daily'][0]['rain'].toString() : '0';
//     for (dynamic item in json['daily']) {
//       WeatherModel wd = WeatherModel(
//           nameLocation: w.nameLocation,
//           urlStatusIcon: item['weather'][0]['icon'],
//           temp: (item['temp']['day']).toString(),
//           tempMin: (item['temp']['min']).toString(),
//           tempMax: (item['temp']['max']).toString(),
//           clounds: item['clouds'].toString(),
//           rain: item['rain'] != null ? item['rain'].toString() : '0',
//           day: await convertDaysToDateTime(item['dt'], 0),
//           descriptionWeather: (item['weather'][0]['description']).toString(),
//           speedWind: (item['wind_speed']).toString(),
//           sunset: await convertDaysToDateTime(json['current']['sunset'], 1),
//           sunrise: await convertDaysToDateTime(json['current']['sunrise'], 1));
//       arr_daily.add(wd);
//     }

//     for (dynamic item in json['hourly']) {
//       WeatherModel wd = WeatherModel(
//         nameLocation: w.nameLocation,
//         urlStatusIcon: item['weather'][0]['icon'],
//         temp: (item['temp']).toString(),
//         tempMin: (item['temp']).toString(),
//         tempMax: (item['temp']).toString(),
//         clounds: item['clouds'].toString(),
//         hour: await convertDaysToDateTime(item['dt'], 1),
//         descriptionWeather: (item['weather'][0]['description']).toString(),
//         speedWind: (item['wind_speed']).toString(),
//       );
//       arr_hourly.add(wd);
//     }

//     return ForestWeatherModel(
//       currentWeather: w,
//       daily: arr_daily,
//       hourly: arr_hourly,
//     );
//   }

//   List<ForeCastData> getChartData1(ForestWeatherModel? model) {
//     if (model != null) {
//       return model.daily.map((daily) {
//         return ForeCastData(
//           day: daily.day.toString(),
//           forecast: daily.temp.toString(),
//         );
//       }).toList();
//     } else {
//       return [];
//     }
//   }

//   List<ForeCastData> getChartData2(ForestWeatherModel? model) {
//     if (model != null) {
//       return model.daily.map((daily) {
//         return ForeCastData(
//           day: daily.day.toString(),
//           forecast:daily.rain.toString(),
//         );
//       }).toList();
//     } else {
//       return [];
//     }
//   }

//   static Future<String> convertDaysToDateTime(int days, int choose) async {
//     final dt = DateTime.fromMillisecondsSinceEpoch(days * 1000);
//     DateFormat timeFormat = DateFormat('HH:mm');
//     String formattedTime = timeFormat.format(dt);

//     DateFormat dateFormat = DateFormat('dd/MM');
//     String formattedDate = dateFormat.format(dt);
//     if (choose == 0) {
//       return formattedDate.toString();
//     } else {
//       return formattedTime.toString();
//     }
//   }
// }
