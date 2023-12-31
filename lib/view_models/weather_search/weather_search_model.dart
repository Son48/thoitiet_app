import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/core/constants/constants.dart';
import 'package:thoitiet_app/core/data/models/location/location.dart';
import 'package:thoitiet_app/core/data/models/locationJSON/locationJSON.dart';
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
  List<LocationModel> _weatherSearch = [];
  List<LocationModel> get weatherSearch => _weatherSearch;

  // List to store unique history items
  List<LocationModel> _weatherHistory = [];
  List<LocationModel> get weatherHistory => _weatherHistory;

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
      List<LocationJSONModel> searchResult = await getListTest();
      List<LocationModel> covertList = [];
      for (LocationJSONModel element in searchResult) {
        LocationModel lm = LocationModel(
            lat: element.coord!.lat,
            lon: element.coord!.lon,
            nameLocation: element.nameLocation);
        covertList.add(lm);
      }
      setSearchWeather(covertList);
    } catch (e) {
      print("Error searching weather: $e");
    }
    notifyListeners();
  }

  // Method to set the search results
  void setSearchWeather(List<LocationModel> list) {
    _weatherSearch = list;
    notifyListeners();
  }

  // Method to filter and set unique history items
  void setHistoryWeather(List<LocationModel> list) {
    Set<String> uniqueLocations = {};
    List<LocationModel> filteredList = [];

    for (int i = list.length - 1; i >= 0; i--) {
      LocationModel location = list[i];
      if (!uniqueLocations.contains(location.nameLocation)) {
        uniqueLocations.add(location.nameLocation.toString());
        filteredList.add(location);
      }
    }

    _weatherHistory = filteredList.toList();
    notifyListeners();
  }

  // Method to fetch test data based on the search query
  Future<List<LocationJSONModel>> getListTest() async {
    if (_searchQuery.isEmpty) {
      return [];
    }
    List<LocationJSONModel> searchResult = [];
    final listLocation = await Constants.convert();
    for (LocationJSONModel location in listLocation!) {
      if (location.nameLocation!
          .toLowerCase()
          .contains(_searchQuery.toLowerCase())) {
        searchResult.add(location);
      }
    }
    return searchResult;
  }

  // Method to fetch all search history from SQLite
  Future<List<LocationModel>> getAllSearchFromSQL() async {
    try {
      List<LocationModel> historyWeather =
          await SearchData().fetchAllSearchFromLocal();
      return historyWeather;
    } catch (e) {
      return [];
    }
  }

  // Method to fetch all search history from SQLite and set the state
  Future<void> getAllSearchFromSQLAndSetState() async {
    try {
      List<LocationModel> historyWeather = await getAllSearchFromSQL();
      setHistoryWeather(historyWeather);
      notifyListeners();
    } catch (e) {
      print("Error setting history weather: $e");
    }
  }

  // Method to insert a favorite item into SQLite
  Future<void> insertFavoriteFromSQL(LocationModel history) async {
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
  Future<void> deleteFavoriteFromSQL(LocationModel history) async {
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
