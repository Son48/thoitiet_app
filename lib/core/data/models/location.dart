import 'dart:ffi';

class Location {
  String? lon;
  String? lat;
  String? nameLocation;
  Location({this.lon, this.lat,this.nameLocation});

  factory Location.mapSQLtoModel(Map<String, dynamic> map) =>
      Location(lat: map['lat'].toString(), lon: map['lon'].toString(),nameLocation: map['nameLocation']);
}
