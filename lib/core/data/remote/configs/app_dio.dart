import 'dart:convert';

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
  Object? convertResponseToObject(
    Response<String> response,
    String serviceName,
    String apiUrl,
  ) {
    print(
      "[$serviceName]API:【$apiUrl】[RESPONSE_RESULT] [${response.statusCode}]",
    );
    final body = response.data ?? "";
    print("[RESPONSE_BODY] => $body");
    dynamic responseJson = jsonDecode(body == "" ? "{}" : body);
    if (response.statusCode == 200) {
      print("[$serviceName]API:【$apiUrl】[responseJson] $responseJson");

      return _convertResponseJson(responseJson);
    }
    return null;
  }

  Object _convertResponseJson(dynamic responseJson) {
    if (responseJson['result'] is Map) {
      return responseJson['result'] as Map<String, dynamic>;
    } else if (responseJson['result'] is List) {
      return responseJson['result'] as List<dynamic>;
    } else {
      return responseJson as Map<String, dynamic>;
    }
  }
}
