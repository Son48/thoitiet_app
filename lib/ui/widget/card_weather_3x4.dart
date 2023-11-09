import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/core/data/models/weather.dart';
import 'package:thoitiet_app/view_models/weather_home/weather_home_model.dart';

import '../../view_models/weather_report_model/weather_report_model.dart';

class CardWeather extends ConsumerWidget {
  final WeatherModel data;
  bool favorite = false;

  CardWeather({super.key, required this.data});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherModel = ref.watch(weatherProvider);
    final reportModel=ref.watch(weatherReportProvider);
    List<WeatherModel> listFavorites = weatherModel.weatherFavories;
    final reportModel = ref.watch(weatherReportProvider);
    //check to remove item in favorites
    void removeWeatherInFavorites(WeatherModel data) {
      print('remove');
      for (WeatherModel item in listFavorites) {
        if (item.lat.toString() == data.lat.toString() &&
            item.lon.toString() == data.lon.toString()) {
          listFavorites.remove(item);
          weatherModel.deleteFavoriteFromSQL(item);
        }
      }
    }

    for (WeatherModel item in listFavorites) {
      if (item.lat.toString() == data.lat.toString()) {
        favorite = true;
      }
    }
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: AspectRatio(
        //w/h
        aspectRatio: 3 / 4,
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
              color: Color.fromARGB(255, 38, 155, 251),
              borderRadius: BorderRadius.circular(10),
              child: Container(
                //background image in component
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient:
                          LinearGradient(begin: Alignment.bottomRight, colors: [
                        Colors.black.withOpacity(.2),
                        Colors.black.withOpacity(.0),
                      ])),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 65,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 50,
                                child: Text(data.nameLocation.toString(),
                                    softWrap: true,
                                    style:
                                        const TextStyle(color: Colors.white)),
                              ),
                              SizedBox(
                                child: Column(
                                  children: [
                                    Text('${data.clounds}%',
                                        style: const TextStyle(
                                            color: Colors.white70)),
                                    IconButton(
                                      icon: !favorite
                                          ? const Icon(
                                              size: 20,
                                              Icons.favorite_border,
                                              color: Color.fromARGB(
                                                  255, 243, 255, 69),
                                            )
                                          : const Icon(
                                              size: 20,
                                              Icons.favorite,
                                              color: Color.fromARGB(
                                                  255, 243, 255, 69),
                                            ),
                                      onPressed: () {
                                        weatherModel
                                            .setUpdateFavoritesWeather();
                                        if (!favorite) {
                                          print('insert');
                                          listFavorites.add(data);
                                          weatherModel
                                              .insertFavoriteFromSQL(data);
                                        } else {
                                          //check
                                          removeWeatherInFavorites(data);
                                        }
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 120,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 80,
                                width: 80,
                                child: Image.network(
                                    "https://openweathermap.org/img/wn/${data.urlStatusIcon}.png",
                                    fit: BoxFit.fitWidth),
                              ),
                              Text(
                                data.descriptionWeather.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '${data.tempMin}° - ${data.tempMax}°',
                          style: const TextStyle(
                            color: Colors.white70,
                          ),
                        )
                      ],
                    ),
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

//end
