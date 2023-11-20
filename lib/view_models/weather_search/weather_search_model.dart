import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/core/constants/constants.dart';
import 'package:thoitiet_app/core/data/models/location.dart';
import 'package:thoitiet_app/core/data/sqflite/SearchData.dart';

import '../../core/data/reponsitories/weather_reponsitory.dart';

// Define a provider for WeatherSearchViewModel
final weatherSearchProvider = ChangeNotifierProvider<WeatherSearchViewModel>(
  (ref) => WeatherSearchViewModel(ref),
);

class WeatherSearchViewModel extends ChangeNotifier {
  WeatherSearchViewModel(this._reader);

  final Ref _reader;

  // List to store search results
  List<Location> _weatherSearch = [];

  List<Location> get weatherSearch => _weatherSearch;

  // List to store unique history items
  List<Location> _weatherHistory = [];

  List<Location> get weatherHistory => _weatherHistory;

  // Boolean to track whether default data should be used
  bool _defaultData = false;

  bool get defaultData => _defaultData;

  String _announceResults = '';
  String get announceResults => _announceResults;

  Future<void> setAnnounceResults(String announceResults) async {
    _announceResults = announceResults;
    notifyListeners();
  }

  // TextEditingController for the search input
  TextEditingController _searchController = TextEditingController();
  TextEditingController get getController => _searchController;

  // String to store the search query
  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  // Method to set the default data flag
  Future<void> setDefaultData(bool isDefault) async {
    _defaultData = isDefault;
  }

  // Method to set the search input controller
  Future<void> setController(String searchController) async {
    _searchController.text = searchController;
    notifyListeners();
  }

  // Method to handle changes in the search input
  void handleSearch(String query) {
    setSearchQuery(query);
    notifyListeners();
  }

  // Method to set the search query and fetch search results
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

  // Method to set the search results
  void setSearchWeather(List<Location> list) {
    _weatherSearch = list;
    notifyListeners();
  }

  // Method to filter and set unique history items
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

  // Method to fetch test data based on the search query
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

  // Method to fetch all search history from SQLite
  Future<List<Location>> getAllSearchFromSQL() async {
    try {
      List<Location> historyWeather =
          await SearchData().fetchAllSearchFromLocal();
      return historyWeather;
    } catch (e) {
      return [];
    }
  }

  // Method to fetch all search history from SQLite and set the state
  Future<void> getAllSearchFromSQLAndSetState() async {
    try {
      List<Location> historyWeather = await getAllSearchFromSQL();
      setHistoryWeather(historyWeather);
      notifyListeners();
    } catch (e) {
      print("Error setting history weather: $e");
    }
  }

  // Method to insert a favorite item into SQLite
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

  // Method to delete a favorite item from SQLite and update the state
  Future<void> deleteFavoriteFromSQL(Location history) async {
    try {
      print('Xóa khỏi local');
      await SearchData()
          .deleteTable(history.lon.toString(), history.lat.toString());

      // Xóa các thành phần có cùng nameLocation
      _weatherHistory.removeWhere(
          (location) => location.nameLocation == history.nameLocation);

      notifyListeners();
    } catch (e) {
      print("Error deleting data from SQLite: $e");
    }
  }
  void handleHorizontalSwipe(DragEndDetails? details, BuildContext context) {
    if (details!.primaryVelocity! > 0 || details!.primaryVelocity! < 0) {
      if (FocusManager.instance.primaryFocus?.hasFocus ?? false) {
        FocusManager.instance.primaryFocus?.unfocus();
        if (Navigator.canPop(context)) {
          setSearchQuery('');
          setController('');
        } else {
          Navigator.pop(context);
        }
      }
    }
  }


}
