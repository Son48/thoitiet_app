import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/core/constants/firebase_api.dart';
import 'package:thoitiet_app/core/data/notificatons/notification_services.dart';
import 'package:thoitiet_app/firebase_options.dart';
import 'package:thoitiet_app/ui/view/favorites/home_favorites.dart';
import 'package:thoitiet_app/ui/view/news/home_news_weather.dart';
import 'package:thoitiet_app/ui/view/news/news_weater.dart';
import 'package:thoitiet_app/ui/view/search/weather_search_view.dart';
import 'package:thoitiet_app/ui/view/setting/home_setting.dart';
import 'package:thoitiet_app/ui/view/splash/splash.dart';
import 'package:thoitiet_app/ui/view/weather_home/weather_home_screen.dart';
import 'package:thoitiet_app/ui/widget/bottom_bar.dart';
import 'package:thoitiet_app/ui/view/alert/alert.dart';

import 'package:thoitiet_app/ui/view/weather_report/weather_report_view.dart';
import 'package:workmanager/workmanager.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
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
      case 'REDIRECT':
        {
          print('redirect');
          navigatorKey.currentState?.push(
            MaterialPageRoute(builder: (_) => WeatherHome()),
          );
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
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseAPI().initNotification();
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
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Weather App',
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        routes: {
          "home": (context) => WeatherHome(),
          "detail-news": (context) => NewsWeather(),
          "news": (context) => NewsHome(),
          "detail-weather": (context) => WeatherReportView(),
          "search": (context) => WeatherSearch(),
        },
        home: const Splash(),
      ),
    );
  }
}
