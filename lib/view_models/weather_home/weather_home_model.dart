import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/core/constants/constants.dart';
import 'package:thoitiet_app/core/data/models/weather.dart';
import 'package:thoitiet_app/core/data/reponsitories/weather_reponsitory.dart';
import 'package:thoitiet_app/core/data/sqflite/FavoritesData.dart';
import 'package:thoitiet_app/view_models/base_view_model.dart';

final weatherProvider = ChangeNotifierProvider<WeatherHomeViewModel>(
    (ref) => WeatherHomeViewModel(ref));

final WeatherReponsitory _weatherReponsitory = WeatherReponsitory();

//CALL FOR OBJECT AND DEFINE SOME FUCTION TO HANDLE DATAA
class WeatherHomeViewModel extends ChangeNotifier {
  WeatherHomeViewModel(this._reader);
  final Ref _reader;

  List<WeatherModel> weathers = [];
  List<WeatherModel> weathersRecommend = [];
  bool isLoading = false;

  bool _isDefaultData = false;
  bool get isDefaultData => _isDefaultData;
  List<WeatherModel> weatherFavories = [];
  void setIsDefaultData(bool isDefault) {
    _isDefaultData = isDefault;
    notifyListeners();
  }

  bool _updateFavoritesWeather = false;
  bool get updateFavoritesWeather => _isDefaultData;
  void setUpdateFavoritesWeather(bool isDefault) {
    _updateFavoritesWeather = isDefault;
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
  Future<void> getDataRecomendWeather() async {
    try {
      weathersRecommend.clear();
      for (var location in Constants.listFavorites) {
        final res = await _weatherReponsitory.getWeatherData(
            location.lat.toString(), location.lon.toString());
        if (res != null) {
          weathersRecommend.add(res);
        }
      }
      notifyListeners();
    } on Exception {
      rethrow;
    }
  }

  Future<List<WeatherModel>> getAllFavoriteFromSQL() async {
    List<WeatherModel> w = await FavoritesData().fetchAllFavoritesFromLocal();
    return w;
  }

  Future<void> insertFavoriteFromSQL(String lon, String lat) async {
    int w = await FavoritesData().insertTable(lon, lat);
    print(w);
  }
}
