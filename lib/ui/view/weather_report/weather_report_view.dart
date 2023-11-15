import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/ui/widget/card_report.dart';
import 'package:thoitiet_app/ui/widget/pre_loading.dart';
import 'package:thoitiet_app/ui/widget/transparent_button.dart';
import 'package:thoitiet_app/view_models/Setting_Notification/setting_notification_model.dart';
import 'package:thoitiet_app/view_models/weather_home/weather_home_model.dart';
import 'package:thoitiet_app/view_models/weather_report_model/weather_report_model.dart';
import 'package:thoitiet_app/core/constants/constants.dart';

import '../../../core/data/models/forest_weather.dart';
import '../../../core/data/models/weather.dart';
import '../../widget/column_chart.dart';
import '../../widget/hourly_forecard_item.dart';
import '../../widget/weather_forecast_item.dart';

class WeatherReportView extends ConsumerWidget {
  const WeatherReportView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportModel = ref.watch(weatherReportProvider);
    WeatherModel? weatherModel = reportModel.weatherModel;
    bool isFavovite = reportModel.isFavoritesWeather;
    final handleTimeToNotifi = ref.watch(weatherFavoritesProvider);
    final listFavorites = ref.watch(weatherProvider);

    ForestWeatherModel? forestWeatherModel = reportModel.forestWeatherModel;
    void addFavorites() async {
      await reportModel.setDefaultData(false);
      listFavorites.weatherFavories.add(weatherModel!);
      listFavorites.insertFavoriteFromSQL(weatherModel);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (reportModel.defaultData) {
        return;
      }
      await reportModel.getDataForestWeather(weatherModel!);
      await reportModel.setDefaultData(true);
      await reportModel.setFavoriteWeather();

      await handleTimeToNotifi.getListSettingFromLocal(weatherModel);
    });
    return SafeArea(
      child: !reportModel.defaultData
          ? PreLoading()
          : Scaffold(
              body: Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    gradient:
                        LinearGradient(begin: Alignment.bottomRight, colors: [
                  colorBackground,
                  Color.fromRGBO(9, 98, 169, 1),
                  Color.fromRGBO(9, 100, 169, 1),
                  Color.fromRGBO(9, 98, 140, 1)
                ])),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 32,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              'Thời tiết ${weatherModel!.nameLocation.toString()}',
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 150,
                        child: CardReport(
                          tag: weatherModel.nameLocation.toString(),
                          temp: weatherModel.temp.toString(),
                          tempmin: weatherModel.tempMin.toString(),
                          tempmax: weatherModel.tempMax.toString(),
                          nameLocation: weatherModel.nameLocation.toString(),
                          urlStatusIcon: weatherModel.urlStatusIcon.toString(),
                          descriptionWeather:
                              weatherModel.descriptionWeather.toString(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //container 2
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Center(
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              'Dự báo thời tiết trong 24h tới',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            isFavovite
                                ? Icon(Icons.favorite, color: Colors.yellow)
                                : IconButton(
                                    icon: const Icon(
                                      Icons.favorite_border_outlined,
                                      color: Colors.yellow,
                                    ),
                                    onPressed: () {
                                      addFavorites();
                                    },
                                  ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              isFavovite
                                  ? 'Đã có trong danh mục yêu thích !'
                                  : 'Thêm vào danh mục yêu thích ',
                              style: TextStyle(color: Colors.yellow),
                            )
                          ],
                        ),
                      ),
                      //set up time to send notification
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text('Lên lịch thông báo cho địa điểm này',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Icons.timer_outlined,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(
                                  width: 60,
                                  child: Text(
                                    handleTimeToNotifi.errorTime,
                                    style:
                                        const TextStyle(color: Colors.yellow),
                                  )),
                              Row(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Giờ: ',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 65,
                                        height: 40,
                                        child: TextField(
                                          style: const TextStyle(
                                              color: Colors.white),
                                          cursorColor: Colors.white,
                                          keyboardType: const TextInputType
                                              .numberWithOptions(
                                            signed: false,
                                            decimal: false,
                                          ),
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(2),
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'^\d+\.?\d*')),
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'^\d+\.?\d{0,1}')),
                                          ],
                                          controller:
                                              handleTimeToNotifi.hourController,
                                          decoration: const InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Color.fromARGB(
                                                      255,
                                                      255,
                                                      255,
                                                      255)), //<-- SEE HERE
                                            ),
                                            border: OutlineInputBorder(),
                                            fillColor: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Phút: ',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 65,
                                        height: 40,
                                        child: TextField(
                                          controller: handleTimeToNotifi
                                              .minutesController,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          cursorColor: Colors.white,
                                          keyboardType: const TextInputType
                                              .numberWithOptions(
                                            signed: false,
                                            decimal: false,
                                          ),
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(2),
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'^\d+\.?\d*')),
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'^\d+\.?\d{0,1}')),
                                          ],
                                          decoration: const InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Color.fromARGB(
                                                      255,
                                                      255,
                                                      255,
                                                      255)), //<-- SEE HERE
                                            ),
                                            border: OutlineInputBorder(),
                                            fillColor: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () => handleTimeToNotifi
                                          .handleTimeNoti(weatherModel),
                                      child: const Row(
                                        children: [
                                          Text(
                                            'Lưu',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Icon(
                                            Icons.done,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [
                              colorBackground,
                              Color.fromRGBO(70, 117, 194, 1),
                              Color.fromRGBO(40, 109, 189, 1),
                              Color.fromRGBO(10, 98, 140, 1)
                            ]),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, right: 10, bottom: 20),
                          child: SizedBox(
                            height: 120,
                            child: ListView.builder(
                              itemCount: forestWeatherModel?.hourly.length,
                              itemBuilder: (context, index) =>
                                  HourlyForecastItem(
                                hourly: forestWeatherModel!.hourly[index],
                              ),
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Material(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20.0),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Container(
                                      alignment: Alignment.topLeft,
                                      child: const Text(
                                        "Chất lượng không khí",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Icon(
                                            Icons.water_drop,
                                            color: Color.fromARGB(
                                                255, 249, 236, 124),
                                            size: 30,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Độ ẩm",
                                                style: TextStyle(
                                                    color: Colors.white70),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                ' ${forestWeatherModel?.currentWeather?.clounds.toString()}%',
                                                style: const TextStyle(
                                                    color: Colors.white70,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Icon(
                                            Icons.dew_point,
                                            color: Color.fromARGB(
                                                255, 249, 236, 124),
                                            size: 30,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Cảm giác',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                ' ${forestWeatherModel?.currentWeather?.feelLike.toString()}°',
                                                style: const TextStyle(
                                                    color: Colors.white70,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.air_rounded,
                                            size: 30,
                                            color: Color.fromARGB(
                                                255, 249, 236, 124),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Tốc độ gió",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                '${forestWeatherModel?.currentWeather?.speedWind.toString()}m/s',
                                                style: const TextStyle(
                                                    color: Colors.white70,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.sunny,
                                            size: 30,
                                            color: Color.fromARGB(
                                                255, 249, 236, 124),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Chỉ số UV",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                '${forestWeatherModel?.currentWeather?.uvi.toString()} UV',
                                                style: TextStyle(
                                                    color: Colors.white70,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.remove_red_eye,
                                            color: Color.fromARGB(
                                                255, 249, 236, 124),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Tầm nhìn",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                '${forestWeatherModel?.currentWeather?.visibility.toString()} m',
                                                style: TextStyle(
                                                    color: Colors.white70,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.cloudy_snowing,
                                            color: Color.fromARGB(
                                                255, 249, 236, 124),
                                            size: 30,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Lượng mưa",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                '${forestWeatherModel?.currentWeather != null ? forestWeatherModel?.currentWeather?.rain.toString() : 'Không có'}',
                                                style: TextStyle(
                                                    color: Colors.white70,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
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
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Material(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                                Colors.black.withOpacity(.2),
                                Colors.black.withOpacity(.0),
                              ],
                            ),
                          ),
                          child: Stack(
                            children: [
                              const Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  "Nhiệt độ 7 ngày tới",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 500,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount:
                                            forestWeatherModel?.daily.length,
                                        itemBuilder: (context, index) =>
                                            WeatherForecastItem(
                                          daily:
                                              forestWeatherModel!.daily[index],
                                        ),
                                        scrollDirection: Axis.vertical,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10, left: 10),
                              child: Text(
                                "Khả năng nhiệt độ và lượng mưa ${forestWeatherModel?.currentWeather?.nameLocation.toString()} ",
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                          ColumnChart(
                            chartData1: forestWeatherModel!
                                .getChartData1(forestWeatherModel),
                            chartData2: forestWeatherModel
                                .getChartData2(forestWeatherModel),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
