class ApiEndPointConstants {
  const ApiEndPointConstants._();
  //api get weather in localtion
  static String weatherInLocation(String lat, String lon) {
    return "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=c34d0b30de706ed953190741dcd852f2&units=metric&lang=vi";
  }
}
