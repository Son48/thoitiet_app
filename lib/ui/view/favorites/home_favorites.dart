import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/constans/constains.dart';
import 'package:thoitiet_app/core/data/models/forest_weather.dart';
import 'package:thoitiet_app/core/data/models/weather.dart';
import 'package:thoitiet_app/ui/view/news/home_news_weather.dart';

import 'package:thoitiet_app/ui/widget/card_weather_3x4.dart';
import 'package:thoitiet_app/view_models/weather_home/weather_home_model.dart';
import 'package:thoitiet_app/view_models/weather_home/weather_forest_model.dart';

import '../../widget/column_chart.dart';

bool isLoadingWeatherForest = true;

class FavovitesHome extends ConsumerWidget {
  //
  const FavovitesHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherModel = ref.watch(weatherProvider);
    List<WeatherModel> listFavorites = weatherModel.weatherFavories;

    final weatherForestModel = ref.watch(weatherForestAndFavoriteProvider);
    WeatherModel? weatherFavorite = weatherForestModel.favoriteChosse;

    //detail data detail forest
    ForestWeatherModel? forestWeatherModel =
        weatherForestModel.forestWeatherModel;
    //set the first value
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (weatherForestModel.defaultData) {
        isLoadingWeatherForest = false;
        //check delete item in drop list
        if (listFavorites.isNotEmpty &&
            !listFavorites.contains(weatherFavorite)) {
          await weatherForestModel.setFavoriteChosse(listFavorites[0]);
          //call api forest
          await weatherForestModel.getDataForestWeather(weatherFavorite!);
        }
        return;
      }
      if (listFavorites.isNotEmpty) {
        await weatherForestModel.setFavoriteChosse(listFavorites[0]);
        await weatherForestModel.setDefaultData(true);
        //call api forest
        await weatherForestModel
            .getDataForestWeather(weatherFavorite ?? listFavorites[0]);
      } else {}
    });

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
            child: (listFavorites.isEmpty)
                ? Container(
                    margin: EdgeInsets.only(top: 150),
                    child: SizedBox(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: const Text(
                        'Chưa có danh mục nào trong thư mục thời tiết yêu thích',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 10, top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                itemCount: weatherModel.isLoading
                                    ? 0
                                    : listFavorites.length,
                                itemBuilder: (context, index) => CardWeather(
                                  data: listFavorites[index],
                                  favorite: true,
                                ),
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                          ),
                        ),
                        // detail show card weather

                        //check loading
                        forestWeatherModel != null && !isLoadingWeatherForest
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.white,
                                              ),
                                              'Chi tiết thời tiết tại: '),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: (listFavorites.isNotEmpty)
                                                ? DropdownButton(
                                                    underline: Container(
                                                      height: 2,
                                                      color: Colors.white,
                                                    ),
                                                    //check trường hợp, nếu xóa luôn item trang chọn trong listitem, thì item được chọn sẽ là giá trị đàu tiên cuả mảng
                                                    value:
                                                        listFavorites.contains(
                                                                weatherFavorite)
                                                            ? weatherFavorite
                                                            : listFavorites[0],
                                                    dropdownColor: Colors.blue,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 13),
                                                    icon: const Icon(
                                                      Icons.arrow_downward,
                                                      color: Colors.white,
                                                      size: 15,
                                                    ),
                                                    items: listFavorites.map<
                                                            DropdownMenuItem<
                                                                WeatherModel>>(
                                                        (item) {
                                                      return DropdownMenuItem<
                                                              WeatherModel>(
                                                          value: item,
                                                          child: Text(item
                                                              .nameLocation
                                                              .toString()));
                                                    }).toList(),
                                                    onChanged:
                                                        (WeatherModel? value) {
                                                      weatherForestModel
                                                          .setFavoriteChosse(
                                                              value!);
                                                      isLoadingWeatherForest =
                                                          true;
                                                    },
                                                  )
                                                : const SizedBox(width: 0),
                                          )
                                        ],
                                      ),
                                    ),
                                    //banner detail card

                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(
                                                15.0), // Độ bo tròn
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/banner-card.png'),
                                                fit: BoxFit.fill)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text(
                                                    "Thời tiết ${forestWeatherModel!.currentWeather!.nameLocation} ",
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 10),
                                                    child: Text(
                                                        "ngày${forestWeatherModel.currentWeather?.day.toString()}",
                                                        style: const TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255),
                                                          fontSize: 12,
                                                        )),
                                                  ),
                                                  Text(
                                                    "${forestWeatherModel.currentWeather!.tempMin!.toString()} °C • ${forestWeatherModel.currentWeather!.tempMax!.toString()} °C",
                                                    style: const TextStyle(
                                                        color: Colors.white70,
                                                        fontSize: 13),
                                                  ),
                                                  Text(
                                                    forestWeatherModel
                                                        .currentWeather!
                                                        .descriptionWeather!
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white70,
                                                        fontSize: 13),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "${forestWeatherModel.currentWeather!.temp!.toString()} °C",
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 35,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 80,
                                              child: Image.network(
                                                  "https://openweathermap.org/img/wn/${forestWeatherModel.currentWeather?.urlStatusIcon.toString()}.png",
                                                  fit: BoxFit.fitHeight),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )

                                    //forest detail 24h
                                    ,
                                    const Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Text(
                                        'Dự báo thời tiết trong 24h tới',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 17),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 8.0, top: 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                                begin: Alignment.topLeft,
                                                colors: [
                                                  colorBackground,
                                                  Color.fromRGBO(
                                                      70, 117, 194, 1),
                                                  Color.fromRGBO(
                                                      40, 109, 189, 1),
                                                  Color.fromRGBO(10, 98, 140, 1)
                                                ]),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20, right: 10, bottom: 20),
                                          child: SizedBox(
                                            height: 120,
                                            child: ListView.builder(
                                              itemCount: forestWeatherModel
                                                  .hourly.length,
                                              itemBuilder: (context, index) =>
                                                  itemForestCardWeather(
                                                      forestWeatherModel
                                                          .hourly[index]),
                                              scrollDirection: Axis.horizontal,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    // air
                                    const Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, bottom: 10),
                                      child: Text(
                                        "Chất lượng không khí",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 17),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 4, top: 2),
                                          child: Text(
                                            'Độ ẩm trong không khí đạt đến: ${forestWeatherModel.currentWeather?.clounds.toString()}%',
                                            style: const TextStyle(
                                                color: Colors.white70),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.only(left: 4, top: 2),
                                          child: Text(
                                            'Cảm giác như: ${forestWeatherModel.currentWeather?.feelLike.toString()}°',
                                            style: TextStyle(
                                                color: Colors.white70),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.only(left: 4, top: 2),
                                          child: Text(
                                            'Tốc độ gió: ${forestWeatherModel.currentWeather?.speedWind.toString()}m/s',
                                            style: TextStyle(
                                                color: Colors.white70),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.only(top: 2, left: 4),
                                          child: Text(
                                            'Chỉ số UV hiện tại: ${forestWeatherModel.currentWeather?.uvi.toString()} UV',
                                            style: TextStyle(
                                                color: Colors.white70),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.only(left: 4, top: 2),
                                          child: Text(
                                            'Tầm nhìn xa trung bình:  ${forestWeatherModel.currentWeather?.visibility.toString()} m',
                                            style: TextStyle(
                                                color: Colors.white70),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.only(left: 4, top: 2),
                                          child: Text(
                                            'Lượng mưa: ${forestWeatherModel.currentWeather != null ? forestWeatherModel.currentWeather?.rain.toString() : 'Không có'}',
                                            style: TextStyle(
                                                color: Colors.white70),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 8.0),
                                          child: Text(
                                            'Lưu ý: viêm họng bão lũ mưa giông gì đó',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ),

                                    //daily weather
                                    const Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, bottom: 20),
                                      child: Text(
                                        'Dự báo thời tiết trong 7 ngày tới',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 17),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10, bottom: 20),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.blue[700],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: SizedBox(
                                          height: 250,
                                          child: ListView.builder(
                                            itemCount:
                                                forestWeatherModel.daily.length,
                                            itemBuilder: (context, index) =>
                                                itemForestDailyWeather(
                                                    forestWeatherModel
                                                        .daily[index]),
                                            scrollDirection: Axis.horizontal,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: EdgeInsets.all(0),
                                            child: Text(
                                              "Nhiệt độ và lượng mưa ${forestWeatherModel.currentWeather?.nameLocation.toString()} những ngày tới",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 13),
                                            ),
                                          ),
                                        ),
                                        ColumnChart(
                                          chartData1:
                                              forestWeatherModel.getChartData1(
                                                  forestWeatherModel),
                                          chartData2:
                                              forestWeatherModel.getChartData2(
                                                  forestWeatherModel),
                                        ),
                                      ],
                                    ),

                                    //end
                                  ])
                            : const Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Column(
                                  children: [
                                    Text(
                                      'Đang được cập nhật...',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(height: 200, child: PreLoading())
                                  ],
                                ),
                              ),
                      ],
                    ),
                  )),
      ))),
    );
  }

  Padding itemForestDailyWeather(WeatherModel daily) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 85,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              daily.day.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 1,
              child: Container(color: Colors.white),
            ),
            SizedBox(
              height: 80,
              child: Image.network(
                  "https://openweathermap.org/img/wn/${daily.urlStatusIcon}.png",
                  fit: BoxFit.fitHeight),
            ),
            Text(
              daily.descriptionWeather.toString(),
              style: TextStyle(color: Colors.white),
            ),
            Text('${daily.tempMin} - ${daily.tempMax} °C',
                style: TextStyle(color: Colors.white, fontSize: 12)),
            Text(
              'Độ ẩm: ${daily.clounds}%',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Mặt trời mọc: ${daily.sunrise}',
              style: TextStyle(color: Colors.white70, fontSize: 11),
            ),
            Text(
              'mặt trời lặn: ${daily.sunset}',
              style: TextStyle(color: Colors.white70, fontSize: 11),
            )
          ],
        ),
      ),
    );
  }

  Column itemForestCardWeather(WeatherModel hourly) {
    return Column(
      children: [
        Text(
          " ${hourly.temp.toString()} °C",
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
        SizedBox(
          height: 80,
          child: Image.network(
              "https://openweathermap.org/img/wn/${hourly.urlStatusIcon}.png",
              fit: BoxFit.fitWidth),
        ),
        Text(
          hourly.hour.toString(),
          style: TextStyle(color: Colors.white, fontSize: 15),
        )
      ],
    );
  }

//end
}
