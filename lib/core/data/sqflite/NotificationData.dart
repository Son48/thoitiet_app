import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:thoitiet_app/core/data/models/Notification.dart';
import 'package:thoitiet_app/core/data/models/setting_notifi.dart';
import 'package:thoitiet_app/core/data/models/weather.dart';
import 'package:thoitiet_app/core/data/reponsitories/weather_reponsitory.dart';
import 'package:thoitiet_app/core/data/sqflite/db.dart';

class NotificationData {
  final tableName = 'notification_alert';
  //function to create table
  Future<void> createTable(Database database) async {
    await database.execute(
        "CREATE TABLE $tableName (lon STRING, lat STRING,  hour STRING, minute STRING, year STRING, nameLocation STRING, alert STRING, dtCurrent STRING, urlIcon STRING);");
  }

  //function to insert to table
  Future<int> insertTable(
    String lon,
    String lat,
    String hour,
    String year,
    String alert,
    String minute,
    String nameLocation,
    String dateCurrent,
    String urlIcon,
  ) async {
    print('date current${dateCurrent}');

    final database = await DatabaseService().database;
    if (database != null) {
      print('insert t todb');
      return await database.rawInsert(
          'INSERT INTO $tableName(lon, lat, hour, minute,year, alert, nameLocation, dtCurrent, urlIcon) VALUES($lon, $lat,$hour, $minute, $year, "$alert", "$nameLocation","$dateCurrent", "$urlIcon" )');
    } else {
      return 0;
    }
  }

  //fucntion delete favorites in db
  Future<int> deleteTable(String lon, String lat, String hour, String minute,
      String dtCurrent) async {
    final database = await DatabaseService().database;
    if (database != null) {
      return await database.rawInsert(
          'DELETE FROM $tableName WHERE lon = ? AND lat = ? AND hour = ? AND minute = ? AND dtCurrent = ?',
          [lon, lat, hour, minute, dtCurrent]);
    } else {
      return 0;
    }
  }

  ///function to get all favorites
  Future<List<NotificationModel>> fetchAllNotificationFromLocal() async {
    final database = await DatabaseService().database;
    if (database != null) {
      final notificationData =
          await database.rawQuery("SELECT * FROM $tableName");
      List<NotificationModel> listNotification = notificationData
          .map((notification) => NotificationModel.mapSQLtoModel(notification))
          .toList();
      return listNotification;
    } else {
      print('chua tao duoc db');
      return List.empty();
    }
  }
}
