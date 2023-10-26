import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/ui/view/news/news_weater.dart';
import 'package:thoitiet_app/ui/view/weather_home/weather_home_screen.dart';
import 'package:thoitiet_app/view_models/weather_home/weather_home_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Weather App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark(
          useMaterial3: true,
        ),
        routes: {
          "/": (context) => const WeatherHome(),
          "/news": (context) => const NewsWeather(),
        },
      ),
    );
  }
}
