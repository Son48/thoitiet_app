import 'package:thoitiet_app/core/constants/api_end_point.dart';
import 'package:thoitiet_app/core/data/models/weather.dart';
import 'package:thoitiet_app/core/data/remote/services/base_service.dart';

class WeatherService extends BaseService {
  WeatherService(super.appDio);

  //  Future<Map<String, dynamic>> getWeatherInLocation({
  //   required String param,
  // }) async {
  //   return await get(
  //     ApiEndPointConstants.weatherInLocation,
  //     param: param,
  //     mapper: (json) =>
  //         WeatherModel.fromJson(json as Map<String, dynamic>);
  //   )
  // }
}
