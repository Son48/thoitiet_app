import 'package:flutter/material.dart';
class WeatherForecastItem extends StatelessWidget {
  final String time;
  final String imageUrl;
  final String temperature1;
  final String temperature2;

  const WeatherForecastItem({
    Key? key,
    required this.time,
    required this.temperature1,
    required this.imageUrl,
    required this.temperature2,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Container(
        width: 500,
        padding: const EdgeInsets.only(right: 20,left: 20,top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,// Sử dụng Row để sắp xếp theo chiều ngang
          children: [
            Text(
              time,
              style: const TextStyle(fontSize: 13, color: Colors.white),
            ),
            const SizedBox(width: 5), // Khoảng cách giữa Text và Image
            Image.network(
              imageUrl,
              fit: BoxFit.fitWidth,
              width: 40, // Chiều rộng của hình ảnh
              height: 40, // Chiều cao của hình ảnh
            ),
            const SizedBox(width: 20), // Khoảng cách giữa Image và Text nhiệt độ
                Text(
                  temperature1,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
                Text(
                  temperature2,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFFE3E2E2)
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
