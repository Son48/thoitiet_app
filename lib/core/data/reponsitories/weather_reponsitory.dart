import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/core/constants/api_end_point.dart';
import 'package:thoitiet_app/core/data/models/weather.dart';

class WeatherReponsitory {
  final dio = Dio();

  Future getWeatherData(String lat, String lon) async {
    var response;
    try {
      response =
          await dio.get(ApiEndPointConstants.weatherInLocation(lat, lon));
      if (response.statusCode == 200) {
        return await WeatherModel.fromJson(
            jsonDecode(await response.toString()));
      }
      return await WeatherModel.fromJson(jsonDecode(await response.toString()));
    } on Exception {
      rethrow;
    }
  }
}
