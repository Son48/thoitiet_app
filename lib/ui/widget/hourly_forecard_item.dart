import 'package:flutter/material.dart';
import 'package:thoitiet_app/core/data/models/weather_hourly/weather_hourly.dart';

class HourlyForecastItem extends StatelessWidget {
  const HourlyForecastItem({
    Key? key,
    required this.hourly, // Thay thế Image bằng String
  });
  final WeatherHourlyModel hourly;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              "${hourly.temp?.toString()} °C",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Image.network(
              "https://openweathermap.org/img/wn/${hourly.listStatusWeather![0].urlStatusIcon}.png", // Sử dụng imageUrl để tải hình ảnh từ một URL
              fit: BoxFit.fitWidth,
            ),
            Text(
              hourly.hour.toString(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
