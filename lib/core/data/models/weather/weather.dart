import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:thoitiet_app/core/data/models/clounds_attribute/clounds_attribute.dart';
import 'package:thoitiet_app/core/data/models/coord_attribute/coord_attribute.dart';
import 'package:thoitiet_app/core/data/models/rain_hourly/rain_hourly.dart';
import 'package:thoitiet_app/core/data/models/sun_status_attribute/sun_status_attribute.dart';
import 'package:thoitiet_app/core/data/models/temporary/temporary.dart';
import 'package:thoitiet_app/core/data/models/weather_attribute/weather_attribute.dart';
import 'package:thoitiet_app/core/data/models/wind_attribute/wind_attribute.dart';
part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class WeatherModel with _$WeatherModel {
  factory WeatherModel({
    String? day,
    String? hour,
    @JsonKey(name: 'weather') List<WeatherAttributeModel>? listStatusWeather,
    @JsonKey(name: 'name') String? nameLocation,
    @JsonKey(name: 'main') TemporaryModel? temporary,
    @JsonKey(name: 'clouds') CloundModel? clounds,
    @JsonKey(name: 'wind') WindModel? winds,
    @JsonKey(name: 'sun') SunModel? sun,
    @JsonKey(name: 'rain') RainHourlyModel? rain,
    @JsonKey(name: 'coord') CoordModel? coord,
  }) = _WeatherModel;
  factory WeatherModel.fromJson(Map<String, Object?> json) =>
      _$WeatherModelFromJson(json).copyWith(
          day: convertDaysToDateTime(int.parse(json['dt'].toString()), 0),
          hour: convertDaysToDateTime(int.parse(json['dt'].toString()), 1));
  factory WeatherModel.mapSQLtoModel(Map<String, dynamic> map) =>
      WeatherModel(coord: CoordModel(lat: map['lat'], lon: map['lon']));

  static String convertDaysToDateTime(int days, int choose) {
    final dt = DateTime.fromMillisecondsSinceEpoch(days * 1000);
    DateFormat timeFormat = DateFormat('HH:mm');
    String formattedTime = timeFormat.format(dt);

    DateFormat dateFormat = DateFormat('dd/MM');
    String formattedDate = dateFormat.format(dt);
    if (choose == 0) {
      return formattedDate.toString();
    } else {
      return formattedTime.toString();
    }
  }
  // static Future<String> convertDaysToDateTime(int days, int choose) async {
  //   final dt = DateTime.fromMillisecondsSinceEpoch(days * 1000);
  //   DateForma timeFormat = DateFormat('HH:mm');
  //   String formattedTime = timeFormat.format(dt);

  //   DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  //   String formattedDate = dateFormat.format(dt);
  //   if (choose == 0) {
  //     return formattedDate.toString();
  //   } else {
  //     return formattedTime.toString();
  //   }
  // }
}


// // class WeatherModel {
// //   String? nameLocation;
// //   String? urlStatusIcon;
// //   //nhiet do trung binh
// //   String? temp;
// //   //nhiet do nho nhat
// //   String? tempMin;
// //   // nhiet do lon nhat
// //   String? tempMax;
// //   //do am
// //   String? clounds;
// //   //trang thai thoi tiet
// //   String? descriptionWeather;
// //   //toc do gio
// //   String? speedWind;
// //   String? lon;
// //   String? lat;
// //   String? day;
// //   String? hour;
// //   String? feelLike;
// //   String? rain;
// //   String? uvi;
// //   String? visibility;
// //   String? sunrise;
// //   String? sunset;

// //   WeatherModel(
// //       {this.nameLocation,
// //       this.urlStatusIcon,
// //       this.temp,
// //       this.tempMin,
// //       this.tempMax,
// //       this.clounds,
// //       this.descriptionWeather,
// //       this.speedWind,
// //       this.day,
// //       this.hour,
// //       this.lon,
// //       this.feelLike,
// //       this.rain,
// //       this.uvi,
// //       this.visibility,
// //       this.sunrise,
// //       this.sunset,
// //       this.lat});
// //   static Future<WeatherModel> fromJson(
// //       Map<String, dynamic> json, String lat, String lon) async {
// //     return WeatherModel(
// //         nameLocation: json['name'],
// //         urlStatusIcon: json['weather'][0]['icon'],
// //         temp: (json['main']['temp']).toString(),
// //         tempMin: (json['main']['temp_min']).toString(),
// //         tempMax: (json['main']['temp_max']).toString(),
// //         clounds: (json['clouds']['all']).toString(),
// //         descriptionWeather: (json['weather'][0]['description']).toString(),
// //         speedWind: (json['wind']['speed']).toString(),
// //         day: await convertDaysToDateTime(json['dt'], 0),
// //         hour: await convertDaysToDateTime(json['dt'], 1),
// //         feelLike: json['main']['feels_like'].toString(),
// //         lat: lat,
// //         lon: lon);
// //   }


// //   static Future<String> convertDaysToDateTime(int days, int choose) async {
// //     final dt = DateTime.fromMillisecondsSinceEpoch(days * 1000);
// //     DateFormat timeFormat = DateFormat('HH:mm');
// //     String formattedTime = timeFormat.format(dt);

// //     DateFormat dateFormat = DateFormat('dd/MM/yyyy');
// //     String formattedDate = dateFormat.format(dt);
// //     if (choose == 0) {
// //       return formattedDate.toString();
// //     } else {
// //       return formattedTime.toString();
// //     }
// //   }

// //   //map from sqflite to model
// //   factory WeatherModel.mapSQLtoModel(Map<String, dynamic> map) =>
// //       WeatherModel(lat: map['lat'].toString(), lon: map['lon'].toString());
// // }
