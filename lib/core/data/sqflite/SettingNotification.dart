import 'package:sqflite/sqflite.dart';
import 'package:thoitiet_app/core/data/models/setting_notifi.dart';
import 'package:thoitiet_app/core/data/models/weather.dart';
import 'package:thoitiet_app/core/data/reponsitories/weather_reponsitory.dart';
import 'package:thoitiet_app/core/data/sqflite/db.dart';

class SettingNotification {
  final tableName = 'setting_notification';
  //function to create table
  Future<void> createTable(Database database) async {
    await database.execute(
        "CREATE TABLE $tableName (lon STRING, lat STRING,  hour STRING, minute STRING, nameLocation STRING);");
  }

  //function to insert to table
  Future<int> insertTable(String lon, String lat, String hour, String minute,
      String nameLocation) async {
    final database = await DatabaseService().database;
    if (database != null) {
      return await database.rawInsert(
          'INSERT INTO $tableName(lon, lat, hour, minute, nameLocation) VALUES($lon, $lat,$hour, $minute, "$nameLocation")');
    } else {
      return 0;
    }
  }

  //fucntion delete favorites in db
  Future<int> deleteTable(
      String lon, String lat, String hour, String minute) async {
    final database = await DatabaseService().database;
    if (database != null) {
      return await database.rawInsert(
          'DELETE FROM $tableName WHERE lon = ? AND lat = ? AND hour = ? AND minute = ?',
          [lon, lat, hour, minute]);
    } else {
      return 0;
    }
  }

  ///function to get all favorites
  Future<List<SettingNotificationModel>> fetchAllSetingFromLocal() async {
    final database = await DatabaseService().database;
    if (database != null) {
      final settingLocal = await database.rawQuery("SELECT * FROM $tableName");
      List<SettingNotificationModel> listSetting = settingLocal
          .map((setting) => SettingNotificationModel.mapSQLtoModel(setting))
          .toList();
      return listSetting;
    } else {
      print('chua tao duoc db');
      return List.empty();
    }
  }

  //fucton to get detail setting in localstorage
  Future<List<SettingNotificationModel>> getSetingFromLocal(
      WeatherModel w) async {
    final database = await DatabaseService().database;
    if (database != null) {
      final settingLocal = await database.rawQuery(
          "SELECT * FROM $tableName WHERE lon = ? AND lat = ?",
          [w.coord!.lon.toString(), w.coord!.lat.toString()]);
      List<SettingNotificationModel> listSetting = settingLocal
          .map((setting) => SettingNotificationModel.mapSQLtoModel(setting))
          .toList();
      return listSetting;
    } else {
      print('chua tao duoc db');
      return List.empty();
    }
  }
}
