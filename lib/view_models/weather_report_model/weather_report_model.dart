import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/core/constants/constants.dart';
import 'package:thoitiet_app/core/data/geolocator/geolocator_setting.dart';
import 'package:thoitiet_app/core/data/models/forest_weather.dart';
import 'package:thoitiet_app/core/data/models/setting_notifi.dart';
import 'package:thoitiet_app/core/data/models/weather.dart';
import 'package:thoitiet_app/core/data/reponsitories/weather_reponsitory.dart';
import 'package:thoitiet_app/core/data/sqflite/FavoritesData.dart';
import 'package:thoitiet_app/core/data/sqflite/SettingNotification.dart';

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
  bool _defautDataFavorite = false;
  bool get defaultDataFavorite => _defautDataFavorite;
  void setDefaultDataFavorite(bool df) {
    _defautDataFavorite = df;
    notifyListeners();
  }

  List<SettingNotificationModel> _listNotiOfWeather = [];
  List<SettingNotificationModel> get listNotiOfWeather => _listNotiOfWeather;
  Future<void> setListNotiOfWeather(WeatherModel w) async {
    List<SettingNotificationModel> listSettingLocal =
        await SettingNotification().getSetingFromLocal(w);
    _listNotiOfWeather = listSettingLocal;
    notifyListeners();
  }

  Future<void> setWeatherModel(WeatherModel data) async {
    setForestWeatherModel(data);
    _weatherModel = data;
    setDefaultData(false);
    notifyListeners();
  }

  //check favorites weather in report
  bool _isFavoritesWeather = false;
  bool get isFavoritesWeather => _isFavoritesWeather;
  Future<void> setFavoriteWeather() async {
    List<WeatherModel> listFavorites =
        await FavoritesData().fetchAllFavoritesFromLocal();
    for (WeatherModel item in listFavorites) {
      if (item.coord!.lon.toString() == weatherModel?.coord!.lon.toString() &&
          item.coord!.lat.toString() == weatherModel?.coord!.lat.toString()) {
        _isFavoritesWeather = true;
        break;
      } else {
        _isFavoritesWeather = false;
      }
    }
    //end of set data in _isFavoritesWeather
    notifyListeners();
  }

  void setStateFavoriteWeather(bool status) {
    _isFavoritesWeather = status;
    notifyListeners();
  }

  // Call API to get weather data for location
  Future<void> setLocation(Location location) async {
    try {
      final weatherData = await _weatherReponsitory.getWeatherData(
          location.lat.toString(), location.lon.toString());
      _weatherModel = weatherData;
      notifyListeners();
    } catch (e) {
      // Xử lý lỗi nếu có
      print('Error fetching weather data: $e');
    }
  }

  ForestWeatherModel? _forestWeatherModel;

  ForestWeatherModel? get forestWeatherModel => _forestWeatherModel;

  Future<void> setForestWeatherModel(WeatherModel weather) async {
    ForestWeatherModel? frWeather =
        await _weatherReponsitory.getForestWeatherData(
            weather.coord!.lat.toString(), weather.coord!.toString(), weather);
    _forestWeatherModel = frWeather;
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
      WeatherModel? res = await _weatherReponsitory.getWeatherData(
          w.coord!.lat.toString(), w.coord!.lon.toString());

      if (res != null) {
        setForestWeatherModel(res);
      }
    } on Exception {
      rethrow;
    }
  }
}
