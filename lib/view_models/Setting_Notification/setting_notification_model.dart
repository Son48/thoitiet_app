import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/core/data/models/setting_notifi/setting_notifi.dart';
import 'package:thoitiet_app/core/data/models/weather/weather.dart';
import 'package:thoitiet_app/core/data/notificatons/notification_services.dart';
import 'package:thoitiet_app/core/data/reponsitories/weather_reponsitory.dart';
import 'package:thoitiet_app/core/data/sqflite/SettingNotification.dart';
import 'package:workmanager/workmanager.dart';

final weatherFavoritesProvider = ChangeNotifierProvider<WeatherReportViewModel>(
    (ref) => WeatherReportViewModel(ref));

final WeatherReponsitory _weatherReponsitory = WeatherReponsitory();

//CALL FOR OBJECT AND DEFINE SOME FUCTION TO HANDLE DATAA
class WeatherReportViewModel extends ChangeNotifier {
  final Ref _reader;
  WeatherReportViewModel(this._reader);
  final hourController = TextEditingController();
  final minutesController = TextEditingController();

  String _errorTime = "";
  String get errorTime => _errorTime;
  void setErrorTime(String err) {
    _errorTime = err;
    print(err);
    notifyListeners();
  }

//state to check load setting
  bool _loadSetting = false;
  bool get loadSetting => _loadSetting;
  void setLoadSetting(bool loading) {
    _loadSetting = loading;
    notifyListeners();
  }

//list by location
  List<SettingNotificationModel> _listSettingOfWeather = [];
  List<SettingNotificationModel> get listSettingOfWeather =>
      _listSettingOfWeather;
  void setListSetting(List<SettingNotificationModel> list) {
    print('change setting detail');
    _listSettingOfWeather = list;
    notifyListeners();
  }

//all setting
  List<SettingNotificationModel> _listAllSetting = [];
  List<SettingNotificationModel> get listAllSetting => _listAllSetting;
  void setListAllSetting(SettingNotificationModel setting) {
    print('change setting detail');
    _listAllSetting.add(setting);
    notifyListeners();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    hourController.dispose();
    minutesController.dispose();
    super.dispose();
  }

  //handle input of time
  Future<void> handleTimeNoti(WeatherModel w) async {
    bool error = false;

    if (minutesController.text.isEmpty || hourController.text.isEmpty) {
      hourController.text = '00';
      minutesController.text = '00';
      error = true;
    } else {
      // validation  input
      if (int.parse(hourController.text) > 24) {
        hourController.text = '24';
        error = true;
      }
      if (int.parse(minutesController.text) > 60) {
        minutesController.text = '00';
        error = true;
      }
    }
    error ? setErrorTime('Thời gian không hợp lệ!') : setErrorTime('');
    if (!error) {
      int x = await insertSetiingToSQL(
          w, hourController.text, minutesController.text);
      print(x);
      setErrorTime('Thiết lập thành công(cài đặt)!');
    }
    notifyListeners();
  }

//function to get all setting of device
  Future<void> getAllSettingFromLocal() async {
    _listAllSetting = [];
    List<SettingNotificationModel> listSettingLocal =
        await SettingNotification().fetchAllSetingFromLocal();
    print('all setting');
    for (SettingNotificationModel item in listSettingLocal) {
      setListAllSetting(item);
    }
  }

  //fuction to save setting noti in sqlite
  Future<int> insertSetiingToSQL(
      WeatherModel favorite, String hour, String minute) async {
    var w = await SettingNotification().insertTable(
        favorite.coord!.lon.toString(),
        favorite.coord!.lat.toString(),
        hour,
        minute,
        favorite.nameLocation.toString());
    // NotificationService().showNotification(
    //   id: 0,
    //   title: 'Notification Title',
    //   body: 'Notification Body',
    //   scheduledTimeHour: 20,
    //   scheduledTimeMinute: 01,
    // );
    SettingNotificationModel setting = SettingNotificationModel(
        lon: favorite.coord!.lon,
        lat: favorite.coord!.lat,
        hour: int.parse(hour),
        minute: int.parse(minute),
        nameLocation: favorite.nameLocation.toString());
    setListAllSetting(setting);
    // setLoadSetting(false);
    hourController.text = '00';
    minutesController.text = '00';
    print('successfully insert');
    //update worker manager
    print('insert setting in worker');
    Workmanager().cancelAll();
    await NotificationService().scheduledNotifi();
    notifyListeners();
    return w;
  }

  //function to list setting of this weather
  Future<void> getListSettingFromLocal(WeatherModel? w) async {
    hourController.text = '00';
    minutesController.text = '00';
    if (w != null) {
      print(w.nameLocation.toString());
      List<SettingNotificationModel> listSettingLocal =
          await SettingNotification().getSetingFromLocal(w);
      print('list setting of weather');
      (listSettingLocal.isNotEmpty)
          ? setErrorTime('Có ${listSettingLocal.length} thông báo (*cài đặt)')
          : setErrorTime('');
      setListSetting(listSettingLocal);
    }
  }

  //function delet setting into sql// update worker
  Future<void> deleteSettingFromSQL(
      String lon, String lat, String hour, String minute) async {
    print('remove in local');
    var w = await SettingNotification()
        .deleteTable(lon.toString(), lat.toString(), hour, minute);
    print(w);
    setLoadSetting(false);
    for (SettingNotificationModel item in listSettingOfWeather) {
      if (item.hour.toString() == hour &&
          item.minute.toString() == minute &&
          item.lon.toString() == lon &&
          item.lat.toString() == lat) {
        _listSettingOfWeather.remove(item);
        break;
      }
    }
    //update worker manager
    hourController.text = '00';
    minutesController.text = '00';
    print('update workermanager');
    Workmanager().cancelAll();
    await NotificationService().scheduledNotifi();
    setErrorTime('Tải lại để cập nhật...');

    notifyListeners();
  }
}
