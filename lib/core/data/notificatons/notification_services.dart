import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:thoitiet_app/core/data/models/setting_notifi.dart';
import 'package:thoitiet_app/core/data/models/weather.dart';
import 'package:thoitiet_app/core/data/reponsitories/weather_reponsitory.dart';
import 'package:thoitiet_app/core/data/sqflite/NotificationData.dart';
import 'package:thoitiet_app/core/data/sqflite/SettingNotification.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:workmanager/workmanager.dart';

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
            (NotificationResponse notificationResponse) async {});
  }

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max),
        iOS: DarwinNotificationDetails());
  }

  Future showNotification(
      {required int id, String? title, String? body, String? payLoad}) async {
    return notificationsPlugin.show(
        id, title, body, await notificationDetails());
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
      if (initialDelay.inMinutes > 0) {
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
          'Nhiệt độ tại ${w.nameLocation.toString()} ngay lúc này là: ${w.temp}°C, ${w.descriptionWeather}.',
    );
    //save notification in db
    DateTime date = DateTime.now();
    await NotificationData().insertTable(
        lon,
        lat,
        date.hour.toString(),
        date.year.toString(),
        'Nhiệt độ tại ${w.nameLocation.toString()} ngay lúc này là: ${w.temp}°C, ${w.descriptionWeather}.',
        date.minute.toString(),
        w.nameLocation.toString(),
        date.toString(),
        w.urlStatusIcon.toString());
  }
}
