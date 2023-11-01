import 'package:flutter/material.dart';

class HourlyForecastItem extends StatelessWidget {
  final String time;
  final String temperature;
  final String imageUrl; // Thay thế Image bằng String
  const HourlyForecastItem({
    Key? key,
    required this.time,
    required this.temperature,
    required this.imageUrl, // Thay thế Image bằng String
  });

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
              temperature,
              style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Image.network(
              imageUrl, // Sử dụng imageUrl để tải hình ảnh từ một URL
              fit: BoxFit.fitWidth,
            ),
            Text(
              time,
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