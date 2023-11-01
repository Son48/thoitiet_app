import 'package:flutter/material.dart';

import '../core/utils/network_utils.dart';

abstract class BaseViewModel extends ChangeNotifier {
  static final List<ChangeNotifier> _notifierList = [];

  List<ChangeNotifier> get notifierList => _notifierList;

  bool _isEmptyListeners = false;

  bool _isShowLoading = false;

  bool get isShowLoading => _isShowLoading;

  late BuildContext context;

  BaseViewModel({bool isShowLoading = false}) {
    _isShowLoading = isShowLoading;
  }

  void setLoading({required bool isShow}) {
    _isShowLoading = isShow;
    updateCurrentUI();
  }

  //app co ket noi mang ko
  bool hasNetworkConnection() {
    return NetworkUtils.hasConnection();
  }

  void onInitViewModel(BuildContext context) {
    this.context = context;
  }

  bool checkReCalculatorSize({required bool allowReCalculatorSize}) {
    return allowReCalculatorSize;
  }

  void onBuildComplete({bool isNeedReBuildByOtherViewModel = true}) {
    if (isNeedReBuildByOtherViewModel && !_notifierList.contains(this)) {
      _notifierList.add(this);
    }
  }

  void updateCurrentUI() {
    notifyListeners();
  }

  void updateUI() {
    if (!_isEmptyListeners) {
      print('update UI !');
      notifyListeners();
    }
    if (_notifierList.isEmpty) return;

    for (ChangeNotifier notifier in _notifierList) {
      if (notifier != this) {
        print(' curent update UI ');
        notifier.notifyListeners();
      }
    }
  }

  void removeNotifier() {
    if (_notifierList.contains(this)) {
      _notifierList.remove(this);
    }
  }

  void clearNotifier() {
    _notifierList.clear();
  }

  @override
  void dispose() {
    _isEmptyListeners = true;
    removeNotifier();
    super.dispose();
  }
}
