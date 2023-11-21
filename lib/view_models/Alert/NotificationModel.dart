import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/core/data/models/Notification.dart';
import 'package:thoitiet_app/core/data/models/setting_notifi.dart';
import 'package:thoitiet_app/core/data/notificatons/notification_services.dart';
import 'package:thoitiet_app/core/data/reponsitories/weather_reponsitory.dart';
import 'package:thoitiet_app/core/data/sqflite/NotificationData.dart';
import 'package:thoitiet_app/core/data/sqflite/SettingNotification.dart';
import 'package:workmanager/workmanager.dart';

final notificationModelProvider =
    ChangeNotifierProvider<WeatherReportViewModel>(
        (ref) => WeatherReportViewModel(ref));

//CALL FOR OBJECT AND DEFINE SOME FUCTION TO HANDLE DATAA
class WeatherReportViewModel extends ChangeNotifier {
  final Ref _reader;
  WeatherReportViewModel(this._reader);
  List<NotificationModel> _listNotificationModel = [];
  List<NotificationModel> get listNotificaitonModel => _listNotificationModel;
  bool _defaultData = false;
  bool get defaultData => _defaultData;
  Future<void> setDefaultData(bool defaultData) async {
    _defaultData = defaultData;
    notifyListeners();
  }

  Future<void> setListNotificationModel(List<NotificationModel> list) async {
    _listNotificationModel = list;
    notifyListeners();
  }

  Future<void> getAllNotificationUser() async {
    List<NotificationModel> l_notification =
        await NotificationData().fetchAllNotificationFromLocal();
    List<NotificationModel> reversedList = List.from(l_notification.reversed);
    print(l_notification.length);
    setListNotificationModel(reversedList);
  }

  Future<void> deleteNotification(NotificationModel noti) async {
    await NotificationData().deleteTable(
        noti.lon.toString(),
        noti.lat.toString(),
        noti.hour.toString(),
        noti.minute.toString(),
        noti.dateTime.toString());
  }
}
