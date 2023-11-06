import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/core/constants/constants.dart';
import 'package:thoitiet_app/core/data/models/forest_weather.dart';
import 'package:thoitiet_app/core/data/models/weather.dart';
import 'package:thoitiet_app/core/data/reponsitories/weather_reponsitory.dart';
import 'package:thoitiet_app/view_models/base_view_model.dart';

final weatherForestAndFavoriteProvider =
    ChangeNotifierProvider<WeatherForestViewModel>(
        (ref) => WeatherForestViewModel(ref));

final WeatherReponsitory _weatherReponsitory = WeatherReponsitory();

//CALL FOR OBJECT AND DEFINE SOME FUCTION TO HANDLE DATAA
class WeatherForestViewModel extends ChangeNotifier {
  final Ref _reader;
  WeatherModel? _favoriteChosse;
  //the first  value of _forestWeatherModel state is NULL || GET CURRENT LOCATION OF DEVICE
  ForestWeatherModel? _forestWeatherModel;

  //data detail forest
  ForestWeatherModel? get forestWeatherModel => _forestWeatherModel;
  Future<void> setForestWeatherModel( data) async {
    _forestWeatherModel = data;
    notifyListeners();
  }

  //variable to change notifi in the first render
  bool _defaultData = false;
  bool get defaultData => _defaultData;
  Future<void> setDefaultData(bool isDefault) async {
    _defaultData = isDefault;
  }

  //function set value favoriteChosse state
  WeatherModel? get favoriteChosse => _favoriteChosse;
  Future<void> setFavoriteChosse(WeatherModel w) async {
    _favoriteChosse = w;
    print(_favoriteChosse?.nameLocation.toString());
    getDataForestWeather(w);
    notifyListeners();
  }

  WeatherForestViewModel(this._reader);

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