import 'package:flutter/material.dart';

class WeatherForecastItem extends StatelessWidget {
  final String time;
  final String imageUrl;
  final String status;
  final String temperature;
  final String possibility;
   // Thay thế Image bằng String
  const WeatherForecastItem({
    Key? key,
    required this.time,
    required this.temperature,
    required this.imageUrl,
    required this.status,
    required this.possibility, // Thay thế Image bằng String
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
              style: const TextStyle(fontSize: 13, color: Colors.white),
            ),
            Image.network(
              imageUrl, // Sử dụng imageUrl để tải hình ảnh từ một URL
              fit: BoxFit.fitWidth,
            ),
            Text(
                status,
              style: const TextStyle(fontSize: 13,color: Colors.white,),
            ),
            Text(
              time,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.white,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 30,),
            Text(
              possibility,
              style: const TextStyle(color: Colors.white,fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}