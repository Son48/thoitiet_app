import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/core/constants/firebase_api.dart';
import 'package:thoitiet_app/core/controller/NotificationController.dart';
import 'package:thoitiet_app/firebase_options.dart';
import 'package:thoitiet_app/ui/view/favorites/home_favorites.dart';
import 'package:thoitiet_app/ui/view/news/home_news_weather.dart';
import 'package:thoitiet_app/ui/view/news/news_weater.dart';
import 'package:thoitiet_app/ui/view/setting/home_setting.dart';
import 'package:thoitiet_app/ui/view/weather_home/weather_home_screen.dart';
import 'package:thoitiet_app/ui/widget/bottom_bar.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:thoitiet_app/view_models/weather_home/weather_home_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAPI().initNotification();
  // // WidgetsFlutterBinding.ensureInitialized();
  // // // Initialize cho Local Notification
  // await NotificationController.initializeLocalNotifications(debug: true);
  // // Initialize cho Push Notification
  // await NotificationController.initializeRemoteNotifications(debug: true);
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
