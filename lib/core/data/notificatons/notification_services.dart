import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:thoitiet_app/core/data/models/setting_notifi/setting_notifi.dart';
import 'package:thoitiet_app/core/data/models/weather/weather.dart';
import 'package:thoitiet_app/core/data/reponsitories/weather_reponsitory.dart';
import 'package:thoitiet_app/core/data/sqflite/NotificationData.dart';
import 'package:thoitiet_app/core/data/sqflite/SettingNotification.dart';
import 'package:thoitiet_app/ui/view/splash/splash.dart';
import 'package:thoitiet_app/ui/view/weather_home/weather_home_screen.dart';
import 'package:workmanager/workmanager.dart';
import 'package:thoitiet_app/core/constants/constants.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('logo');

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {
      final String? payload = notificationResponse.payload;
      if (notificationResponse.payload != null) {
        print('notification input ${notificationResponse.input}');
        print('notification payload: $payload');
        Constants.navigatorKey.currentState
            ?.pushNamed('detail-weather', arguments: {
          'lon': payload.toString().split('|')[0],
          'lat': payload.toString().split('|')[1],
        });

        // await Workmanager().registerOneOffTask("$payload", "$payload");
        // constraints: Constraints(
        //   networkType: NetworkType.connected,
        // )
      }
    });
  }

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max),
        iOS: DarwinNotificationDetails());
  }

  Future showNotification(
      {required int id, String? title, String? body, String? payLoad}) async {
    return notificationsPlugin
        .show(id, title, body, await notificationDetails(), payload: payLoad);
  }

  //work manager do all 24/7
  //handle scheduled do task notifi by time setting
  Future<void> scheduledNotifi() async {
    print('click');
    var now = DateTime.now();
    List<SettingNotificationModel> listSettingLocal =
        await SettingNotification().fetchAllSetingFromLocal();
    if (listSettingLocal.isEmpty) {
      Workmanager().cancelAll();
      return;
    }
    for (SettingNotificationModel item in listSettingLocal) {
      var specificTime = DateTime(now.year, now.month, now.day,
          int.parse(item.hour.toString()), int.parse(item.minute.toString()));
      var initialDelay = specificTime.difference(now);
      print('time left to notifi: ${initialDelay}');
      if (initialDelay.inMinutes >= 0) {
        await Workmanager().registerPeriodicTask(
          (DateTime.now().second + Random().nextInt(999)).toString() +
              (item.lon.toString()) +
              (item.lat.toString()),
          'CALL_API',
          frequency: Duration(hours: 24),
          inputData: {
            'lon': item.lon.toString(),
            'lat': item.lat.toString(),
          },
          initialDelay: Duration(minutes: initialDelay.inMinutes),
          // constraints: Constraints(
          //   networkType: NetworkType.connected,
          // )
        );
      } else {
        await Workmanager().registerPeriodicTask(
          (DateTime.now().second + Random().nextInt(999)).toString() +
              (item.lon.toString()) +
              (item.lat.toString()),
          'CALL_API',
          frequency: Duration(hours: 24),
          inputData: {
            'lon': item.lon.toString(),
            'lat': item.lat.toString(),
          },
          initialDelay: Duration(minutes: (24 * 60) + initialDelay.inMinutes),
          // constraints: Constraints(
          //   networkType: NetworkType.connected,
          // )
        );
      }
    }
  }

  //fuction to send notifi when task is doing
  Future<void> doSendNotifi(String lon, String lat) async {
    print('request api v2');
    WeatherModel w = await WeatherReponsitory().getWeatherData(lat, lon);
    print(w.nameLocation.toString());
    print('send noti');
    await showNotification(
        id: DateTime.now().second + Random().nextInt(100),
        title: 'Thông báo thời tiết định kì.',
        body:
            'Nhiệt độ tại ${w.nameLocation.toString()} ngay lúc này là: ${w.temporary?.temp.toString()}°C, ${w.listStatusWeather?[0].desWeatherAttribute}.',
        payLoad: '$lon|$lat');
    //save notification in db
    DateTime date = DateTime.now();
    await NotificationData().insertTable(
        lon,
        lat,
        date.hour.toString(),
        date.year.toString(),
        'Nhiệt độ tại ${w.nameLocation.toString()} ngay lúc này là: ${w.temporary?.temp.toString()}°C, ${w.listStatusWeather?[0].desWeatherAttribute}.',
        date.minute.toString(),
        w.nameLocation.toString(),
        date.toString(),
        w.listStatusWeather![0].urlStatusIcon.toString());
  }
}
