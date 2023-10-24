class WeatherModel {
  String? nameLocation;
  String? urlStatusIcon;
  //nhiet do trung binh
  String? temp;
  //nhiet do nho nhat
  String? tempMin;
  // nhiet do lon nhat
  String? tempMax;
  //do am
  String? clounds;
  //trang thai thoi tiet
  String? descriptionWeather;
  //toc do gio
  String? speedWind;

  WeatherModel(
      {this.nameLocation,
      this.urlStatusIcon,
      this.temp,
      this.tempMin,
      this.tempMax,
      this.clounds,
      this.descriptionWeather,
      this.speedWind});
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        nameLocation: json['name'],
        urlStatusIcon: json['weather'][0]['icon'],
        temp: (json['main']['temp']).toString(),
        tempMin: (json['main']['temp_min']).toString(),
        tempMax: (json['main']['temp_max']).toString(),
        clounds: (json['clouds']['all']).toString(),
        descriptionWeather: (json['weather'][0]['description']).toString(),
        speedWind: (json['wind']['speed']).toString());
  }
}
