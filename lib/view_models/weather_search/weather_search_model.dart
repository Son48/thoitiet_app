import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/core/constants/constants.dart';
import 'package:thoitiet_app/core/data/models/location.dart';
import 'package:thoitiet_app/core/data/sqflite/SearchData.dart';

import '../../core/data/reponsitories/weather_reponsitory.dart';

final weatherSearchProvider = ChangeNotifierProvider<WeatherSearchViewModel>(
  (ref) => WeatherSearchViewModel(ref),
);

final WeatherReponsitory _weatherReponsitory = WeatherReponsitory();

class WeatherSearchViewModel extends ChangeNotifier {
  WeatherSearchViewModel(this._reader);

  final Ref _reader;

  List<Location> _weatherSearch = [];

  List<Location> get weatherSearch => _weatherSearch;

  List<Location> _weatherHistory = [];

  List<Location> get weatherHistory => _weatherHistory;

  bool isLoadingWeather = true;
  bool _defaultData = false;

  bool get defaultData => _defaultData;

  Future<void> setDefaultData(bool isDefault) async {
    _defaultData = isDefault;
  }

  TextEditingController _searchController = TextEditingController();

  TextEditingController get getController => _searchController;

  Future<void> setController(String searchController) async {
    _searchController.text = searchController;
    notifyListeners();
  }

  String _searchQuery = '';

  String get searchQuery => _searchQuery;

  void handleSearch(String query) {
    setSearchQuery(query);
    notifyListeners();
  }

  Future<void> setSearchQuery(String query) async {
    _searchQuery = query;
    try {
      List<Location> searchResult = await getListTest();
      setSearchWeather(searchResult);
    } catch (e) {
      print("Error searching weather: $e");
    }
    notifyListeners();
  }

  void setSearchWeather(List<Location> list) {
    _weatherSearch = list;
    notifyListeners();
  }

  void setHistoryWeather(List<Location> list) {
    Set<String> uniqueLocations = {};
    List<Location> filteredList = [];

    for (int i = list.length - 1; i >= 0; i--) {
      Location location = list[i];
      if (!uniqueLocations.contains(location.nameLocation)) {
        uniqueLocations.add(location.nameLocation.toString());
        filteredList.add(location);
      }
    }

    _weatherHistory = filteredList.toList();
    notifyListeners();
  }

  Future<List<Location>> getListTest() async {
    if (_searchQuery.isEmpty) {
      return [];
    }
    List<Location> searchResult = [];
    for (Location location in Constants.listLocation) {
      if (location.nameLocation!
          .toLowerCase()
          .contains(_searchQuery.toLowerCase())) {
        searchResult.add(location);
      }
    }
    return searchResult;
  }

  Future<List<Location>> getAllSearchFromSQL() async {
    try {
      List<Location> historyWeather = await SearchData().fetchAllSearchFromLocal();
      return historyWeather;
    } catch (e) {
      return [];
    }
  }

  //
  Future<void> getAllSearchFromSQLAndSetState() async {
    try {
      List<Location> historyWeather = await getAllSearchFromSQL();
      setHistoryWeather(historyWeather);
      notifyListeners();
    } catch (e) {
      print("Error setting history weather: $e");
    }
  }

  Future<void> insertFavoriteFromSQL(Location history) async {
    try {
      int result = await SearchData().insertTable(
        history.lon.toString(),
        history.lat.toString(),
        history.nameLocation.toString(),
      );
      if (result == 1) {
        print('Thêm thành công');
      }
      notifyListeners();
    } catch (e) {
      print("Error inserting data into SQLite: $e");
    }
  }

  Future<void> deleteFavoriteFromSQL(Location history) async {
    try {
      print('Xóa khỏi local');
      await SearchData().deleteTable(history.lon.toString(), history.lat.toString());

      // Xóa các thành phần có cùng nameLocation
      _weatherHistory.removeWhere((location) => location.nameLocation == history.nameLocation);

      notifyListeners();
    } catch (e) {
      print("Error deleting data from SQLite: $e");
    }
  }
}
