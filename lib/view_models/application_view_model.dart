import 'package:flutter/material.dart';
import 'package:thoitiet_app/view_models/base_view_model.dart';

class ApplicationViewModel extends BaseViewModel {
  ThemeMode? _mode;

  ThemeMode? get mode => _mode;

  void toggleMode(int index) {
    _mode = index == 0 ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  void saveTheme() async {
    if (_mode == ThemeMode.light) {
    } else {}

    notifyListeners();
  }

  ApplicationViewModel({
    ThemeMode mode = ThemeMode.light,
  }) {
    _mode = mode;
    loadTheme();
  }

  void loadTheme() async {
    notifyListeners();
  }

  Future<void> destroySingletonObject() async {
    _destroyRouteInstance();
    // SharedPreference
    _destroySharedPreferenceInstance();
    // InfoUtils
    _destroyInfoUtils();
  }

  void _destroyRouteInstance() {}

  void _destroySharedPreferenceInstance() {
    // TODO(後で処理する)
  }

  void _destroyInfoUtils() {}
}
