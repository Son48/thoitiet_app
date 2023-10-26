import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/core/constants/constants.dart';
import 'package:thoitiet_app/core/data/models/weather.dart';
import 'package:thoitiet_app/core/data/reponsitories/weather_reponsitory.dart';
import 'package:thoitiet_app/view_models/base_view_model.dart';

final weatherProvider = ChangeNotifierProvider<WeatherHomeViewModel>(
    (ref) => WeatherHomeViewModel(ref));

final WeatherReponsitory _weatherReponsitory = WeatherReponsitory();

//CALL FOR OBJECT AND DEFINE SOME FUCTION TO HANDLE DATAA
class WeatherHomeViewModel extends ChangeNotifier {
  WeatherHomeViewModel(this._reader);
  final Ref _reader;

  List<WeatherModel> weathers = [];
  List<WeatherModel> weathersFavorites = [];
  bool isLoading = false;
  bool _isDefaultData = false;
  bool get isDefaultData => _isDefaultData;
  void setIsDefaultData(bool isDefault) {
    _isDefaultData = isDefault;
    notifyListeners();
  }

  //FUNCTION GET DATA FROM API
  Future<void> getDataWeather() async {
    try {
      weathers.clear();
      for (var location in Constants.listLocation) {
        final res = await _weatherReponsitory.getWeatherData(
            location.lat.toString(), location.lon.toString());
        if (res != null) {
          weathers.add(res);
        }
      }
      notifyListeners();
    } on Exception {
      rethrow;
    }
  }

  //FUNCTION GET DATA FROM API
  Future<void> getDataFavoritesWeather() async {
    try {
      weathersFavorites.clear();
      for (var location in Constants.listFavorites) {
        final res = await _weatherReponsitory.getWeatherData(
            location.lat.toString(), location.lon.toString());
        if (res != null) {
          weathersFavorites.add(res);
        }
      }
      notifyListeners();
    } on Exception {
      rethrow;
    }
  }
}
