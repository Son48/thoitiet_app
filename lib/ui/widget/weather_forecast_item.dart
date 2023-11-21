import 'package:flutter/material.dart';
import 'package:thoitiet_app/core/data/models/weather_daily/weather_daily.dart';

class WeatherForecastItem extends StatelessWidget {
  final WeatherDailyModel daily;

  const WeatherForecastItem({
    Key? key,
    required this.daily,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Container(
        width: 500,
        padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, // Sử dụng Row để sắp xếp theo chiều ngang
          children: [
            Text(
              daily.day.toString(),
              style: const TextStyle(fontSize: 13, color: Colors.white),
            ),
            const SizedBox(width: 5), // Khoảng cách giữa Text và Image
            Image.network(
              "https://openweathermap.org/img/wn/${daily.listStatusWeather![0].urlStatusIcon}.png",
              fit: BoxFit.fitWidth,
              width: 40, // Chiều rộng của hình ảnh
              height: 40, // Chiều cao của hình ảnh
            ),
            const SizedBox(
                width: 20), // Khoảng cách giữa Image và Text nhiệt độ
            Text(
              '${daily.temp?.tempDay.toString()} °C',
              style: const TextStyle(
                fontSize: 13,
                color: Colors.white,
              ),
            ),
            Text(
              '${daily.temp?.tempMin.toString()} °C',
              style: const TextStyle(fontSize: 10, color: Color(0xFFE3E2E2)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
