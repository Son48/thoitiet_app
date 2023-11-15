import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routesProvider =
    ChangeNotifierProvider<RoutesProvider>((ref) => RoutesProvider(ref));

//CALL FOR OBJECT AND DEFINE SOME FUCTION TO HANDLE DATAA
class RoutesProvider extends ChangeNotifier {
  final Ref _reader;
  RoutesProvider(this._reader);
  int _selectNumberTab = 0;
  int get selectNumberTab => _selectNumberTab;
  void setSelectNumberTab(int num) {
    _selectNumberTab = num;
    notifyListeners();
  }
}
