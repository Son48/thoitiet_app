import 'package:flutter/material.dart';

class DetailBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final targetHeight = screenHeight * 2 / 3;

    // Tạo danh sách chứa 8 card
    List<Widget> cards = List.generate(8, (index) {
      return Card(
        margin: EdgeInsets.all(8.0),
        child: Container(
          height: targetHeight / 4, // Chia đều cho 4 phần
          child: Center(
            child: Text('Card $index'),
          ),
        ),
      );
    });

    return Container(
      height: targetHeight,
      color: Colors.white,
      child: GridView.count(
        crossAxisCount: 2, // Chia thành 2 cột
        children: cards,
      ),
    );
  }
}