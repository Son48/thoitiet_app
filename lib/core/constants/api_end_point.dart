class ApiEndPointConstants {
  const ApiEndPointConstants._();
  //api get weather in localtion
  static String weatherInLocation(String lat, String lon) {
    return "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=df2f9f2dfd04190a477f24918dd8d87a&units=metric&lang=vi";
  }

  static String forestInLocation(String lat, String lon) {
    return "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=df2f9f2dfd04190a477f24918dd8d87a&units=metric&lang=vi";
  }
}
