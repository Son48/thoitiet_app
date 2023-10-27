import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/ui/view/favorites/home_favorites.dart';
import 'package:thoitiet_app/ui/view/news/home_news_weather.dart';
import 'package:thoitiet_app/ui/view/news/news_weater.dart';
import 'package:thoitiet_app/ui/view/setting/home_setting.dart';
import 'package:thoitiet_app/ui/view/weather_home/weather_home_screen.dart';
import 'package:thoitiet_app/ui/widget/bottom_bar.dart';
import 'package:thoitiet_app/view_models/weather_home/weather_home_model.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Map<int, Widget> routes = {
    0: WeatherHome(),
    1: NewsHome(),
    2: FavovitesHome(),
    4: SettingHome(),
  };
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Weather App',
        debugShowCheckedModeBanner: false,
        routes: {
          "home": (context) => WeatherHome(),
          "detail-news": (context) => NewsWeather(),
          "news": (context) => NewsHome(),
        },
        home: Scaffold(
          bottomNavigationBar: BottomBar(routes: routes),
        ),
      ),
    );
  }
}
