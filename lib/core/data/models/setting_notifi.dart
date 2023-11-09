class SettingNotificationModel {
  String? lon;
  String? lat;
  String? hour;
  String? minute;
  String? nameLocation;
  SettingNotificationModel(
      {this.lon, this.lat, this.hour, this.minute, this.nameLocation});
  //map from sqflite to model
  factory SettingNotificationModel.mapSQLtoModel(Map<String, dynamic> map) =>
      SettingNotificationModel(
          lat: map['lat'].toString(),
          lon: map['lon'].toString(),
          hour: map['hour'].toString(),
          minute: map['minute'].toString(),
          nameLocation: map['nameLocation'].toString());
}
