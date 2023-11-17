import 'package:flutter/material.dart';
import 'package:thoitiet_app/core/constants/constants.dart';
import 'package:thoitiet_app/main.dart';
import 'package:thoitiet_app/ui/view/alert/alert.dart';
import 'package:thoitiet_app/ui/view/favorites/home_favorites.dart';
import 'package:thoitiet_app/ui/view/news/home_news_weather.dart';
import 'package:thoitiet_app/ui/view/setting/home_setting.dart';
import 'package:thoitiet_app/ui/view/weather_home/weather_home_screen.dart';
import 'package:thoitiet_app/ui/widget/bottom_bar.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  final Map<int, Widget> routes = {
    0: WeatherHome(),
    1: NewsHome(),
    2: FavovitesHome(),
    3: AlertView(),
    4: SettingHome(),
  };
  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => SafeArea(
              child: Scaffold(
                bottomNavigationBar: BottomBar(routes: routes),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
            colorBackground,
            Color.fromRGBO(9, 98, 169, 1),
            Color.fromRGBO(9, 100, 169, 1),
            Color.fromRGBO(9, 98, 140, 1)
          ])),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Align(
                  child: SizedBox(
                    width: 270,
                    child: Text(
                      'Dự báo thời tiết Việt Nam',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  width: 270,
                  child: Text(
                    'Tin tức thời tiết cập nhật liên tục trong 24h.',
                    style: TextStyle(color: Colors.yellow),
                  ),
                ),
                Image.network(
                  'https://openweathermap.org/img/wn/02d.png',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(
                  width: 20,
                  height: 20,
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      strokeWidth: 2.0,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Đang tải, vui lòng đợi...',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
