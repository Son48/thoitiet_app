import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:thoitiet_app/core/data/models/location.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:thoitiet_app/core/data/models/locations.dart';

const colorBackground = Color.fromRGBO(9, 98, 169, 1);
const colorBackgoundNavBar = Color.fromRGBO(129, 168, 207, 1);

class Constants {
  const Constants._();

  static final navigatorKey = GlobalKey<NavigatorState>();

  //TODO Constants
  static const String stringEmpty = "";

  /// 15000msec
  static const int timeConnectTimeout = 15000;

  /// 15000msec
  static const int timeSendTimeout = 15000;

  /// 15000msec
  static const int timeReceiveTimeout = 15000;

  /// Error code number
  static const int noErrorCode = -1;
  static const int appTimeOutError = -4;
  static const int noInternet = 0;
  static const int errorCode400 = 400;
  static const int errorCode404 = 404;
  static const int errorCode500 = 500;
  static const int errorCode503 = 503;
  static const int errorCode504 = 504;
  // static List<Location> listLocation = [
  //   // Mĩ tho, Tiền Giang

  // ];

  static Future<List<Location>> convert() async {
    var jsonString =
        await rootBundle.loadString('assets/json/state_code_vn.json');
    var list = json.decode(jsonString) as List<dynamic>;
    return list.map((e) => Location.mapJSONtoModel(e)).toList();
    // Locations localtions = Locations.mapJSONtoModel(jsonDecode(jsonString));
    // final result = localtions.localtions!
    //     .map((item) => Location(
    //         lat: item.lat.toString(),
    //         lon: item.lon.toString(),
    //         nameLocation: item.name))
    //     .toList();
    // return result;
  }
}
