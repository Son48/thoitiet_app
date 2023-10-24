import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:thoitiet_app/core/constants/api_end_point.dart';
import 'package:thoitiet_app/core/data/models/weather.dart';

class WeatherReponsitory {
  final dio = Dio();

  Future getWeatherData() async {
    var response;
    try {
      response =
          await dio.get(ApiEndPointConstants.weatherInLocation.toString());
      if (response.statusCode == 200) {
        print(response);
        return WeatherModel.fromJson(jsonDecode(response.toString()));
      }
    } on Exception {
      rethrow;
    }
  }
}
