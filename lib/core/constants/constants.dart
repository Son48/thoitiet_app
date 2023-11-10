import 'package:flutter/material.dart';
import 'package:thoitiet_app/core/data/models/location.dart';


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
  static List<Location> listLocation = [
    Location(lat: '10.8231', lon: '106.6297',nameLocation: 'Hồ Chí Minh'), // Thành phố Hồ Chí Minh
    Location(lat: '21.0285', lon: '105.8412',nameLocation: 'Hà Nội'), // Hà Nội
    Location(lat: '20.8449', lon: '106.6956',nameLocation: 'Hải Phòng'), // Hải Phòng
    Location(lat: '16.0476', lon: '108.2248',nameLocation: 'Đà Nẵng'), // Đà Nẵng
    Location(lat: '10.0458', lon: '105.7881',nameLocation: 'Cần Thơ'), // Cần Thơ
    Location(lat: '10.6113', lon: '105.1864',nameLocation: 'An giang'), // An Giang
    Location(lat: '10.5380', lon: '107.2407',nameLocation: 'Vũng Tàu'), // Bà Rịa - Vũng Tàu
    Location(lat: '11.3126', lon: '106.7245',nameLocation: 'Bình Dương'), // Bình Dương
    Location(lat: '11.7519', lon: '106.8964',nameLocation: 'Bình Phước'), // Bình Phước
    Location(lat: '11.0367', lon: '108.0978',nameLocation: 'Bình Thuận'), // Bình Thuận
    Location(lat: '16.0678', lon: '108.2208',nameLocation: 'Đà Nẵng'), // Hải Châu, Đà Nẵng
    Location(lat: '17.4691', lon: '106.6159',nameLocation: 'Quảng Bình'), // Đồng Hới, Quảng Bình
    Location(lat: '15.5703', lon: '108.4807',nameLocation: 'Quảng Nam'), // Tam Kỳ, Quảng Nam
    Location(lat: '11.9404', lon: '108.4587',nameLocation: 'Đà Lạt'), // Đà Lạt, Lâm Đồng
    Location(lat: '10.0383', lon: '105.7883',nameLocation: 'Cần Thơ'), // Cần Thơ
    Location(lat: '10.3695', lon: '107.1201',nameLocation: 'Vũng Tàu'), // Vũng Tàu
    Location(lat: '21.7960', lon: '105.8188',nameLocation: 'Mĩ tho'), // Mĩ tho, Tiền Giang
  ];

  static List<Location> listFavorites = [
    Location(lat: '16.0678', lon: '108.2208'), // Hải Châu, Đà Nẵng
    Location(lat: '17.4691', lon: '106.6159'), // Đồng Hới, Quảng Bình
    Location(lat: '15.5703', lon: '108.4807'),
    Location(lat: '18.3428', lon: '105.9057'), // Hà Tĩnh
    Location(lat: '22.7868', lon: '104.9835'), // Hà Giang
    Location(lat: '22.3332', lon: '103.8414'), // Tam Kỳ, Quảng Nam
  ];


}


