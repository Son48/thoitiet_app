class NotificationModel {
  String? lon;
  String? lat;
  String? nameLocation;
  String? hour;
  String? minute;
  String? year;
  String? alert;
  String? dateTime;
  String? urlIcon;
  NotificationModel(
      {this.alert,
      this.hour,
      this.lat,
      this.lon,
      this.minute,
      this.nameLocation,
      this.year,
      this.dateTime,
      this.urlIcon});
//function mapping date from sqlite
  factory NotificationModel.mapSQLtoModel(Map<String, dynamic> map) =>
      NotificationModel(
          lat: map['lat'].toString(),
          lon: map['lon'].toString(),
          hour: map['hour'].toString(),
          minute: map['minute'].toString(),
          nameLocation: map['nameLocation'].toString(),
          year: map['year'].toString(),
          alert: map['alert'].toString(),
          dateTime: map['dtCurrent'].toString(),
          urlIcon: map['urlIcon'].toString());
}
