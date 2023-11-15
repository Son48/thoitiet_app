import 'dart:ffi';

import 'package:sqflite/sqflite.dart';
import 'package:thoitiet_app/core/data/models/location.dart';
import 'package:thoitiet_app/core/data/models/setting_notifi.dart';
import 'package:thoitiet_app/core/data/models/weather.dart';
import 'package:thoitiet_app/core/data/reponsitories/weather_reponsitory.dart';
import 'package:thoitiet_app/core/data/sqflite/db.dart';

class SearchData {
  final WeatherReponsitory _weatherReponsitory = WeatherReponsitory();

  final tableName = 'search_weather';

  //function to create table
  Future<void> createTable(Database database) async {
    await database.execute("CREATE TABLE $tableName (lon STRING, lat STRING, nameLocation STRING);");
  }

  //function to insert to table
  Future<int> insertTable(String lon, String lat, String nameLocation) async {
    final database = await DatabaseService().database;
    if (database != null) {
      return await database
          .rawInsert('INSERT INTO $tableName(lon, lat, nameLocation) VALUES($lon, $lat, "$nameLocation")');
    } else {
      return 0;
    }
  }

  //function to get all search
  Future<List<Location>> fetchAllSearchFromLocal() async {
    final database = await DatabaseService().database;
    if (database != null) {
      final searchLocal = await database.rawQuery("SELECT * FROM $tableName");
      List<Location> listSearch = searchLocal
          .map((search) => Location.mapSQLtoModel(search))
          .toList();
      return listSearch;
    } else {
      print('chua tao duoc db');
      return List.empty();
    }
  }

  //fucntion delete favorites in db
  Future<int> deleteTable(String lon, String lat) async {
    final database = await DatabaseService().database;
    if (database != null) {
      return await database.rawInsert(
          'DELETE FROM $tableName WHERE lon = ? AND lat = ?', [lon, lat]);
    } else {
      return 0;
    }
  }
}
