import 'package:flutter/material.dart';
import 'package:thoitiet_app/constans/constains.dart';

class BottomBar extends StatefulWidget {
  final Map<int, Widget> routes;

  const BottomBar({Key? key, required this.routes}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedTab = 0;

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: widget.routes[_selectedTab],
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: colorBackground,
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedTab,
          onTap: (index) => _changeTab(index),
          selectedItemColor: const Color.fromRGBO(255, 255, 204, 1),
          unselectedItemColor: const Color.fromRGBO(200, 200, 200, 1),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Thời tiết"),
            BottomNavigationBarItem(
                icon: Icon(Icons.newspaper), label: "Tin tức"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Yêu thích"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_active), label: "Thông báo"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Cài đặt"),
          ],
        ),
      ),
    );
  }
}
