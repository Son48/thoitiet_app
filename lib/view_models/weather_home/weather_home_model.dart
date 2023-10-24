import 'package:flutter/material.dart';
import 'package:thoitiet_app/core/data/models/weather.dart';
import 'package:thoitiet_app/core/data/reponsitories/weather_reponsitory.dart';
import 'package:thoitiet_app/ui/view/base_view.dart';
import 'package:thoitiet_app/view_models/base_view_model.dart';

//CALL FOR OBJECT AND DEFINE SOME FUCTION TO HANDLE DATAA
class WeatherHomeViewModel extends BaseViewModel {
  final WeatherReponsitory _weatherReponsitory = WeatherReponsitory();

  //DEFINE LIST OBJECT
  List<WeatherModel> weathers = [];
  @override
  void onInitViewModel(BuildContext context) {
    super.onInitViewModel(context);
    initData();
    print("[$runtimeType][LANDING_VIEW_MODEL] => RUNNING");
  }

  //handle init dataa
  void initData({bool retry = false}) async {
    try {
      await getDataWeather();
    } on Exception catch (error) {}
  }

  //FUNCTION GET DATA FROM API
  Future<void> getDataWeather() async {
    try {
      weathers.clear();
      final res = await _weatherReponsitory.getWeatherData();
      if (res != null) {
        weathers.add(res);
      }
    } on Exception {
      rethrow;
    }
    updateUI();
  }
}
//_notifierList

