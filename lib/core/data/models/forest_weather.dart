import 'package:thoitiet_app/core/data/models/weather.dart';
import 'package:intl/intl.dart';
import 'package:thoitiet_app/core/data/reponsitories/weather_reponsitory.dart';

import '../../../ui/widget/column_chart.dart';

class ForestWeatherModel {
  WeatherModel? currentWeather;
  List<WeatherModel> daily;
  List<WeatherModel> hourly;

  ForestWeatherModel({
    required this.daily,
    required this.hourly,
    this.currentWeather,
  });

  static Future<ForestWeatherModel> fromJson(
      Map<String, dynamic> json, WeatherModel w) async {
    List<WeatherModel> arr_daily = [];
    List<WeatherModel> arr_hourly = [];
    w.rain = json['current']['rain'].toString();
    w.uvi = json['current']['uvi'].toString();
    w.visibility = json['current']['visibility'].toString();

    for (dynamic item in json['daily']) {
      WeatherModel wd = WeatherModel(
          nameLocation: w.nameLocation,
          urlStatusIcon: item['weather'][0]['icon'],
          temp: (item['temp']['day']).toString(),
          tempMin: (item['temp']['min']).toString(),
          tempMax: (item['temp']['max']).toString(),
          clounds: item['clouds'].toString(),
          day: await convertDaysToDateTime(item['dt'], 0),
          descriptionWeather: (item['weather'][0]['description']).toString(),
          speedWind: (item['wind_speed']).toString(),
          sunset: await convertDaysToDateTime(json['current']['sunset'], 1),
          sunrise: await convertDaysToDateTime(json['current']['sunrise'], 1));
      arr_daily.add(wd);
    }

    for (dynamic item in json['hourly']) {
      WeatherModel wd = WeatherModel(
        nameLocation: w.nameLocation,
        urlStatusIcon: item['weather'][0]['icon'],
        temp: (item['temp']).toString(),
        tempMin: (item['temp']).toString(),
        tempMax: (item['temp']).toString(),
        clounds: item['clouds'].toString(),
        hour: await convertDaysToDateTime(item['dt'], 1),
        descriptionWeather: (item['weather'][0]['description']).toString(),
        speedWind: (item['wind_speed']).toString(),
      );
      arr_hourly.add(wd);
    }

    return ForestWeatherModel(
      currentWeather: w,
      daily: arr_daily,
      hourly: arr_hourly,
    );
  }

  List<ForeCastData> getChartData1(ForestWeatherModel? model) {
    if (model != null) {
      return model.daily.map((daily) {
        return ForeCastData(
          day: daily.day.toString(),
          forecast: daily.temp.toString(),
        );
      }).toList();
    } else {
      return [];
    }
  }

  List<ForeCastData> getChartData2(ForestWeatherModel? model) {
    if (model != null) {
      return model.daily.map((daily) {
        return ForeCastData(
          day: daily.day.toString(),
          forecast:"0",
        );
      }).toList();
    } else {
      return [];
    }
  }

  static Future<String> convertDaysToDateTime(int days, int choose) async {
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
