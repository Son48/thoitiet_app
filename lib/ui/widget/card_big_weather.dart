import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/core/data/models/weather.dart';
import 'package:thoitiet_app/view_models/weather_report_model/weather_report_model.dart';

class CardBigWeather extends ConsumerWidget {
  final WeatherModel data;
  CardBigWeather({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportModel = ref.watch(weatherReportProvider);

    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: AspectRatio(
        //w/h
        aspectRatio: 16 / 9,
        // Hero: lib animation when change screen at this point
        child: Hero(
          tag: data.nameLocation.toString() + Random().nextInt(10).toString(),
          //GestureDetector: define one tap in this component
          child: GestureDetector(
            onTap: () {
              reportModel.setWeatherModel(data);
              Navigator.pushNamed(context, 'detail-weather');
            },
            child: Material(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                //background image in component
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/banner-card.png'),
                        fit: BoxFit.fill)),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient:
                          LinearGradient(begin: Alignment.bottomRight, colors: [
                        Colors.black.withOpacity(.2),
                        Colors.black.withOpacity(.0),
                      ])),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8.0, bottom: 10),
                                child: Text(
                                  "${data.temp}°",
                                  style: const TextStyle(
                                      fontSize: 40, color: Colors.white),
                                ),
                              ),
                              Text(
                                "${data.tempMin}° - ${data.tempMax}°",
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.white70),
                              ),
                              Text(
                                data.nameLocation.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ]),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: 90,
                            child: Image.network(
                                "https://openweathermap.org/img/wn/${data.urlStatusIcon}.png",
                                fit: BoxFit.fitWidth),
                          ),
                          Text(
                            data.descriptionWeather.toString(),
                            style: const TextStyle(color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
