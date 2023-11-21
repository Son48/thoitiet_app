import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/core/data/models/forest_weather/forest_weather.dart';
import 'package:thoitiet_app/core/data/models/weather/weather.dart';
import 'package:thoitiet_app/core/data/reponsitories/weather_reponsitory.dart';

import '../../ui/widget/column_chart.dart';

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
  Future<void> setForestWeatherModel(WeatherModel weather) async {
    ForestWeatherModel? frWeather =
    await _weatherReponsitory.getForestWeatherData(
        weather.coord!.lat.toString(), weather.coord!.lon.toString());
    _forestWeatherModel = frWeather;
  }

  //variable to change notifi in the first render
  bool _defaultData = false;
  bool get defaultData => _defaultData;
  Future<void> setDefaultData(bool isDefault) async {
    _defaultData = isDefault;
    notifyListeners();
  }

  //function set value favoriteChosse state
  WeatherModel? get favoriteChosse => _favoriteChosse;
  Future<void> setFavoriteChosse(WeatherModel w) async {
    _favoriteChosse = w;
    print(_favoriteChosse?.nameLocation.toString());
    // getDataForestWeather(w);
    await setForestWeatherModel(w);
    notifyListeners();
  }

  WeatherForestViewModel(this._reader);

  // FUNCTION GET API FOREST WEATHER
  // Future<void> getDataForestWeather(WeatherModel w) async {
  //   try {
  //     final res = await _weatherReponsitory.getForestWeatherData(
  //         w.coord!.lat.toString(), w.coord!.lon.toString(), w);

  //     if (res != null) {
  //       setForestWeatherModel(res);
  //     }
  //     notifyListeners();
  //   } on Exception {
  //     rethrow;
  //   }
  // }

  List<ForeCastData>? getChartData1(ForestWeatherModel? model) {
    if (model != null) {
      return model.daily?.map((daily) {
        return ForeCastData(
          day: daily.day.toString(),
          forecast: daily.temp!.tempDay.toString(),
        );
      }).toList();
    } else {
      return [];
    }
  }

  List<ForeCastData>? getChartData2(ForestWeatherModel? model) {
    if (model != null) {
      return model.daily?.map((daily) {
        return ForeCastData(
          day: daily.day.toString(),
          forecast:daily.rain.toString(),
        );
      }).toList();
    } else {
      return [];
    }
  }
}
