import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/core/constants/api_end_point.dart';
import 'package:thoitiet_app/core/data/models/forest_weather.dart';
import 'package:thoitiet_app/core/data/models/weather.dart';

class WeatherReponsitory {
  final dio = Dio();

  Future getWeatherData(String lat, String lon) async {
    var response;
    try {
      response =
      await dio.get(ApiEndPointConstants.weatherInLocation(lat, lon));
      if (response.statusCode == 200) {
        return WeatherModel.fromJson(jsonDecode(response.toString()), lat, lon);
      }
      return WeatherModel.fromJson(jsonDecode(response.toString()), lat, lon);
    } on Exception {
      rethrow;
    }
  }

  Future<ForestWeatherModel?> getForestWeatherData(String lat, String lon,
      WeatherModel w) async {
    var response;
    try {
      response = await dio.get(ApiEndPointConstants.forestInLocation(lat, lon));
      if (response.statusCode == 200) {
        return ForestWeatherModel.fromJson(jsonDecode(response.toString()), w);
      }
    } on Exception {
      rethrow;
    }
  }
  // Future getWeatherDataByNameLocation(String nameLocation) async {
  //   var response;
  //   try {
  //     response =
  //     await dio.get(ApiEndPointConstants.weatherByName(nameLocation));
  //     if (response.statusCode == 200) {
  //       return WeatherModel.fromJsonName(jsonDecode(response.toString()), nameLocation);
  //     }
  //     return WeatherModel.fromJsonName(jsonDecode(response.toString()), nameLocation);
  //   } on Exception {
  //     rethrow;
  //   }
  // }

}


