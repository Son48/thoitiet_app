import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/core/constants/constants.dart';
import 'package:thoitiet_app/core/data/models/weather.dart';
import 'package:thoitiet_app/core/data/reponsitories/weather_reponsitory.dart';
import 'package:thoitiet_app/core/data/sqflite/FavoritesData.dart';

final weatherProvider = ChangeNotifierProvider<WeatherHomeViewModel>(
    (ref) => WeatherHomeViewModel(ref));

final WeatherReponsitory _weatherReponsitory = WeatherReponsitory();

//CALL FOR OBJECT AND DEFINE SOME FUCTION TO HANDLE DATAA
class WeatherHomeViewModel extends ChangeNotifier {
  WeatherHomeViewModel(this._reader);
  final Ref _reader;

  List<WeatherModel> weathers = [];
  List<WeatherModel> weathersRecommend = [];

  bool isLoading=false;
  bool _isDefaultData = false;
  bool get isDefaultData => _isDefaultData;
  List<WeatherModel> _weatherFavories = [];
  List<WeatherModel> get weatherFavories => _weatherFavories;

  void setIsDefaultData(bool isDefault) {
    _isDefaultData = isDefault;
    _weatherFavories = weatherFavories;
    notifyListeners();
  }

  bool get updateFavoritesWeather => _isDefaultData;
  //set the first list favorites
  Future<void> setUpdateFavoritesWeather() async {
    print('update lại list favorites trong state');
    notifyListeners();
  }

  Future<void> loadDataLocalToState() async {
    print('set the first list favorites');
    _weatherFavories = await getAllFavoriteFromSQL();

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

  Future<bool> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile) {
      // Kết nối dữ liệu di động (3G, 4G, 5G, ...)
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // Kết nối Wi-Fi
      return true;
    } else {
      // Không có kết nối hoặc kết nối khác
      return false;
    }
  }

  Future<List<WeatherModel>> getAllFavoriteFromSQL() async {
    List<WeatherModel> w = await FavoritesData().fetchAllFavoritesFromLocal();
    return w;
  }

  Future<void> insertFavoriteFromSQL(WeatherModel favorite) async {
    var w = await FavoritesData()
        .insertTable(favorite.lon.toString(), favorite.lat.toString());
    if (w == 1) {
      print('THEM THANH CONG');
    }
    notifyListeners();
  }

  Future<void> deleteFavoriteFromSQL(WeatherModel favorite) async {
    print('remove in local');
    var w = await FavoritesData()
        .deleteTable(favorite.lon.toString(), favorite.lat.toString());
    print(w);
    notifyListeners();
  }
}
