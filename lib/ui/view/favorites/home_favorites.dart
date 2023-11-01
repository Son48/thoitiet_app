import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/constans/constains.dart';
import 'package:thoitiet_app/core/data/models/weather.dart';
import 'package:thoitiet_app/ui/view/base_view.dart';
import 'package:thoitiet_app/ui/view/news/home_news_weather.dart';
import 'package:thoitiet_app/ui/widget/bottom_bar.dart';
import 'package:thoitiet_app/ui/widget/card_weather_3x4.dart';
import 'package:thoitiet_app/view_models/weather_home/weather_home_model.dart';
import 'dart:math';

bool isLoadingWeatherFavorites = true;

class FavovitesHome extends ConsumerWidget {
  const FavovitesHome({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherModel = ref.watch(weatherProvider);
    List<WeatherModel> listFavorites = weatherModel.weatherFavories;

    WidgetsBinding.instance.addPostFrameCallback((_) {});
    return SafeArea(
      child: (Scaffold(
          body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
          colorBackground,
          Color.fromRGBO(9, 98, 169, 1),
          Color.fromRGBO(9, 100, 169, 1),
          Color.fromRGBO(9, 98, 140, 1)
        ])),
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            // shrinkWrap: false,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Column(
                children: [
                  //top
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Danh mục thời tiết đã lưu',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      IconButton(
                        icon: const Icon(
                          size: 32,
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),

                  //slide card
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: SizedBox(
                        height: 225,
                        child: ListView.builder(
                          itemCount:
                              weatherModel.isLoading ? 0 : listFavorites.length,
                          itemBuilder: (context, index) => CardWeather(
                            data: listFavorites[index],
                            favorite: true,
                          ),
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ),
                  )
                  //
                  ,
                ],
              ),
            )),
      ))),
    );
  }

  //end
}
