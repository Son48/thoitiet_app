import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/core/constants/constants.dart';
import 'package:thoitiet_app/core/data/models/forest_weather.dart';
import 'package:thoitiet_app/core/data/models/weather.dart';
import 'package:thoitiet_app/core/data/reponsitories/weather_reponsitory.dart';

import '../../core/data/models/location.dart';

final weatherReportProvider = ChangeNotifierProvider<WeatherReportViewModel>(
    (ref) => WeatherReportViewModel(ref));

final WeatherReponsitory _weatherReponsitory = WeatherReponsitory();

//CALL FOR OBJECT AND DEFINE SOME FUCTION TO HANDLE DATAA
class WeatherReportViewModel extends ChangeNotifier {
  final Ref _reader;

  WeatherReportViewModel(this._reader);

  WeatherModel? _weatherModel;

  WeatherModel? get weatherModel => _weatherModel;

  Future<void> setWeatherModel(WeatherModel data) async {
    setForestWeatherModel(data);
    _weatherModel = data;
    setDefaultData(false);
    notifyListeners();
  }

  // Call API to get weather data for location
  Future<void> setLocation(Location location) async {
    try {
      final weatherData = await _weatherReponsitory.getWeatherData(location.lat.toString(), location.lon.toString());
      _weatherModel = weatherData;
      notifyListeners();
    } catch (e) {
      // Xử lý lỗi nếu có
      print('Error fetching weather data: $e');
    }
  }
  ForestWeatherModel? _forestWeatherModel;

  ForestWeatherModel? get forestWeatherModel => _forestWeatherModel;

  Future<void> setForestWeatherModel(data) async {
    _forestWeatherModel = data;
    notifyListeners();
  }

  //variable to change notifi in the first render
  bool _defaultData = false;

  bool get defaultData => _defaultData;

  Future<void> setDefaultData(bool isDefault) async {
    _defaultData = isDefault;
  }

  // FUNCTION GET API FOREST WEATHER

  Future<void> getDataForestWeather(WeatherModel w) async {
    try {
      final res = await _weatherReponsitory.getForestWeatherData(
          w.lat.toString(), w.lon.toString(), w);

      if (res != null) {
        print('hahaha' + res.currentWeather!.nameLocation.toString());
        setForestWeatherModel(res);
      }
      notifyListeners();
    } on Exception {
      rethrow;
    }
  }
}
