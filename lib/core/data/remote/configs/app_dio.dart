import 'package:dio/dio.dart';
import 'package:thoitiet_app/core/constants/constants.dart';
import '../../../constants/api_key.dart';

class AppDio with DioMixin implements Dio {
  AppDio() {
    this.options = BaseOptions(
      baseUrl: openWeatherApiKey,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      responseType: ResponseType.json,
    );
  }
}