import 'package:flutter/material.dart';
import 'package:thoitiet_app/core/data/models/weather.dart';
import 'package:thoitiet_app/core/data/reponsitories/weather_reponsitory.dart';
import 'package:thoitiet_app/ui/view/base_view.dart';
import 'package:thoitiet_app/view_models/base_view_model.dart';

//CALL FOR OBJECT AND DEFINE SOME FUCTION TO HANDLE DATAA
class WeatherHomeViewModel extends BaseViewModel {
  bool isLoading = false;

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
    isLoading = true;
    if (retry) {
      updateUI();
    }
    isLoading = false;
    updateUI();
    try {
      await getDataWeather();
    } on Exception catch (error) {}
  }

  //FUNCTION GET DATA FROM API
  Future<void> getDataWeather() async {
    try {
      weathers.clear();
      WeatherModel w;
      final res = await _weatherReponsitory.getWeatherData();
      if (await res != null) {
        weathers.add(res);
        w = res;
        print(w.tempMin);
        updateUI();
      }
    } on Exception {
      rethrow;
    }
  }
}
//_notifierList

