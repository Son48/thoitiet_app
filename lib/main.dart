import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/core/constants/firebase_api.dart';
import 'package:thoitiet_app/core/data/models/setting_notifi.dart';
import 'package:thoitiet_app/core/data/models/weather.dart';
import 'package:thoitiet_app/core/data/notificatons/notification_services.dart';
import 'package:thoitiet_app/core/data/reponsitories/weather_reponsitory.dart';
import 'package:thoitiet_app/core/data/sqflite/SettingNotification.dart';
import 'package:thoitiet_app/firebase_options.dart';
import 'package:thoitiet_app/ui/view/favorites/home_favorites.dart';
import 'package:thoitiet_app/ui/view/news/home_news_weather.dart';
import 'package:thoitiet_app/ui/view/news/news_weater.dart';
import 'package:thoitiet_app/ui/view/search/weather_search_view.dart';
import 'package:thoitiet_app/ui/view/setting/home_setting.dart';
import 'package:thoitiet_app/ui/view/weather_home/weather_home_screen.dart';
import 'package:thoitiet_app/ui/widget/bottom_bar.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:thoitiet_app/view_models/weather_home/weather_home_model.dart';
import 'package:thoitiet_app/ui/view/weather_report/weather_report_view.dart';
import 'package:workmanager/workmanager.dart';

@pragma(
    'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case 'CALL_API':
        {
          print('pre request api');

          await NotificationService()
              .doSendNotifi(inputData?['lon'], inputData?['lat']);
          break;
        }
      default:
        print("Default ");
    }
    //simpleTask will be emitted here.
    return Future.value(true);
  });
}

void main() async {
  //server send notification
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAPI().initNotification();
  //local send notification
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  // AwesomeNotifications().isNotificationAllowed().then((isAllowed) => {
  //       if (!isAllowed)
  //         {AwesomeNotifications().requestPermissionToSendNotifications()}
  //     });
  WidgetsFlutterBinding.ensureInitialized();
  await Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
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
          "detail-weather": (context) => WeatherReportView(),
          "search":(context)=>WeatherSearch(),
        },
        home: Scaffold(
          bottomNavigationBar: BottomBar(routes: routes),
        ),
      ),
    );
  }
}
