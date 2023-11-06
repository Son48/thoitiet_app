import 'dart:ffi';

import 'package:sqflite/sqflite.dart';
import 'package:thoitiet_app/core/data/models/weather.dart';
import 'package:thoitiet_app/core/data/sqflite/db.dart';

class FavoritesData {
  final tableName = 'favorites_weather';
  //function to create table
  Future<void> createTable(Database database) async {
    await database.execute("CREATE TABLE $tableName (lon STRING, lat STRING);");
  }

  //function to insert to table
  Future<int> insertTable(String lon, String lat) async {
    final database = await DatabaseService().database;
    if (database != null) {
      return await database
          .rawInsert('INSERT INTO $tableName(lon, lat) VALUES($lon, $lat)');
    } else {
      return 0;
    }
  }

  //function to get all favorites
  Future<List<WeatherModel>> fetchAllFavoritesFromLocal() async {
    final database = await DatabaseService().database;
    if (database != null) {
      final favoritesLocal =
          await database.rawQuery("SELECT * FROM $tableName");
      print('helo');
      print(favoritesLocal);
      return favoritesLocal
          .map((weather) => WeatherModel.mapSQLtoModel(weather))
          .toList();
    } else {
      print('chua tao duoc db');
      return List.empty();
    }
  }
}
