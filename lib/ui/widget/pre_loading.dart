import 'package:flutter/material.dart';

class PreLoading extends StatelessWidget {
  const PreLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(9, 98, 169, 1),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                strokeWidth: 2.0,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Đang tải dữ liệu, vui lòng đợi...',
              style: TextStyle(color: Colors.white, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
