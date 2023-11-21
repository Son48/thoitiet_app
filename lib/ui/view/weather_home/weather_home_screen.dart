import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/core/constants/constants.dart';
import 'package:thoitiet_app/core/data/models/weather/weather.dart';
import 'package:thoitiet_app/ui/view/news/home_news_weather.dart';
import 'package:thoitiet_app/ui/widget/card_big_weather.dart';
import 'package:thoitiet_app/ui/widget/card_weather_3x4.dart';
import 'package:thoitiet_app/view_models/weather_home/weather_home_model.dart';
import 'dart:math';

import 'package:thoitiet_app/view_models/weather_report_model/weather_report_model.dart';

bool isLoadingWeather = true;
bool isLoadingWeatherRecommend = true;
final counterProvider = StateProvider<int>((ref) => 0);

class WeatherHome extends ConsumerWidget {
  const WeatherHome({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('home render UI');
    final weatherModel = ref.watch(weatherProvider);
    List<WeatherModel> listWeather = weatherModel.weathers;
    //current weather in location of device
    WeatherModel? currentWeather = weatherModel.currentWeather;
    final reportModel = ref.watch(weatherReportProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      //render ui no condition
      // List<WeatherModel> listFavoritesFromLocal =
      //     await weatherModel.getAllFavoriteFromSQL();

      if (weatherModel.isDefaultData) {
        isLoadingWeather = false;
        isLoadingWeatherRecommend = false;

        return;
      }
      weatherModel.getDataWeather();
      weatherModel.getDataRecomendWeather();
      //get first data from local
      weatherModel.loadDataLocalToState();
      weatherModel.getCurrentWeatherDevice();
      weatherModel.setIsDefaultData(true);
    });
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
                        'Thời tiết hôm nay',
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
                        onPressed: () {
                          Navigator.pushNamed(context, "search");
                        },
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
                        child: isLoadingWeather
                            ? const PreLoading()
                            : ListView.builder(
                                itemCount: listWeather.length,
                                itemBuilder: (context, index) => CardWeather(
                                  data: listWeather[index],
                                ),
                                scrollDirection: Axis.horizontal,
                              ),
                      ),
                    ),
                  ),
                  //,
                  const Padding(
                    padding: EdgeInsets.only(top: 30.0, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Thời tiết tại địa điểm của bạn',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  //weather in current location
                  currentWeather != null
                      ? GestureDetector(
                          onTap: () {
                            reportModel.setWeatherModel(currentWeather!);
                            Navigator.pushNamed(context, 'detail-weather');
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10, top: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/banner-card.png'),
                                    fit: BoxFit.fitWidth),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${currentWeather.temporary?.temp} °',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 40,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 120,
                                          child: Text(
                                            '${currentWeather.nameLocation} hôm nay ${currentWeather.listStatusWeather![0].desWeatherAttribute}.',
                                            style: const TextStyle(
                                                color: Colors.yellow,
                                                fontSize: 16),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                            'Độ ẩm: ${currentWeather.clounds?.clounds}%',
                                            style: const TextStyle(
                                                color: Colors.white)),
                                        Text(
                                            'Tốc độ gió: ${currentWeather.winds?.speed} ms',
                                            style: const TextStyle(
                                                color: Colors.white)),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          width: 120,
                                          child: Image.network(
                                            "https://openweathermap.org/img/wn/${currentWeather.listStatusWeather![0].urlStatusIcon}.png",
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                        Text(
                                            'Cảm giác như : ${currentWeather.temporary?.feelsLike} °C',
                                            style:
                                                TextStyle(color: Colors.white))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : const PreLoading(),
                  const Padding(
                    padding: EdgeInsets.only(top: 30.0, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Gợi ý cho bạn',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  //slide card
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: SizedBox(
                        height: 170,
                        child: isLoadingWeatherRecommend
                            ? PreLoading()
                            : ListView.builder(
                                itemCount:
                                    weatherModel.weathersRecommend.length,
                                itemBuilder: (context, index) => CardBigWeather(
                                    data:
                                        weatherModel.weathersRecommend[index]),
                                scrollDirection: Axis.horizontal,
                              ),
                      ),
                    ),
                  )
                  //news
                  ,
                  const Padding(
                    padding: EdgeInsets.only(top: 30.0, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Bản tin thời tiết',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  //card news
                  ListView.builder(
                    // scrollDirection: f,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    padding: const EdgeInsets.all(8),
                    itemBuilder: (BuildContext context, int index) {
                      return NewsCardItem(context);
                    },
                  )
                ],
              ),
            )),
      ))),
    );
  }

//news cart
  Container NewsCardItem(context) {
    return Container(
        height: 130,
        child: Hero(
          tag: Random().nextInt(9999999).toString(),
          child: GestureDetector(
            onTap: () => {Navigator.pushNamed(context, 'detail-news')},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //image new
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: SizedBox(
                      height: 110,
                      width: MediaQuery.of(context).size.width * 1 / 4,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(20), // Đặt bán kính bo tròn
                          child: Image.network(
                            'https://www.elle.vn/wp-content/uploads/2017/07/25/hinh-anh-dep-1.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //detail card news
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width * 3 / 4) - 50,
                    height: 80,
                    child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Tổng Hợp",
                            style: TextStyle(color: Colors.white70),
                          ),
                          SizedBox(
                            width: 230,
                            child: Text(
                              "Dự báo thời tiết- đêm 7 và ngày 24, trời, âm âm, u u và nhớ em.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text('Xem thêm',
                              style: TextStyle(
                                color: Colors.white,
                              ))
                        ]),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
