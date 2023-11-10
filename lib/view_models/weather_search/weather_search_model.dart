import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/core/constants/constants.dart';
import 'package:thoitiet_app/core/data/models/location.dart';
import 'package:thoitiet_app/core/data/models/weather.dart';
import 'package:thoitiet_app/core/data/reponsitories/weather_reponsitory.dart';

final weatherSearchProvider = ChangeNotifierProvider<WeatherSearchViewModel>(
    (ref) => WeatherSearchViewModel(ref));

final WeatherReponsitory _weatherReponsitory = WeatherReponsitory();

class WeatherSearchViewModel extends ChangeNotifier {
  WeatherSearchViewModel(this._reader);

  final Ref _reader;

  List<Location> _weatherSearch = [];

  List<Location> get weatherSearch => _weatherSearch;

  bool isLoadingWeather = true;

  //set get fist default data
  bool _defaultData = false;

  bool get defaultData => _defaultData;

  Future<void> setDefaultData(bool isDefault) async {
    _defaultData = isDefault;
  }

  //set get controller
  TextEditingController _searchController = TextEditingController();

  TextEditingController get getController => _searchController;

  Future<void> setController(String searchController) async {
    _searchController.text = searchController;
    notifyListeners();
  }

  //set get query search
  String _searchQuery = '';

  String get searchQuery => _searchQuery;

  // handle search
  void handleSearch(String query) {
    setSearchQuery(query);
    notifyListeners();
  }

  Future<void> setSearchQuery(String query) async {
    _searchQuery = query;
    //call fucn search
    List<Location> l_test = await getListTest();
    print(l_test.length);
    //set state
    setSearchWeather(l_test);
    notifyListeners();
  }

  //set list location
  void setSearchWeather(List<Location> list) {
    _weatherSearch = list;
    notifyListeners();
  }

  //get list location
  Future<List<Location>> getListTest() async {
    if (_searchQuery.isEmpty) {
      return [];
    }
    List<Location> l_test = [];
    for (Location location in Constants.listLocation) {
      if (location.nameLocation!
          .toLowerCase()
          .contains(_searchQuery.toLowerCase())) {
        l_test.add(location);
      }
    }
    return l_test;
  }

  bool isCurrentRoute = true;
}
