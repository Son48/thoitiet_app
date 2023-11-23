import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/core/data/models/forest_weather/forest_weather.dart';
import 'package:thoitiet_app/core/data/models/setting_notifi/setting_notifi.dart';
import 'package:thoitiet_app/core/data/models/weather/weather.dart';
import 'package:thoitiet_app/ui/widget/card_report.dart';
import 'package:thoitiet_app/ui/widget/pre_loading.dart';
import 'package:thoitiet_app/ui/widget/transparent_button.dart';
import 'package:thoitiet_app/view_models/Setting_Notification/setting_notification_model.dart';
import 'package:thoitiet_app/view_models/weather_home/weather_home_model.dart';
import 'package:thoitiet_app/view_models/weather_report_model/weather_report_model.dart';
import 'package:thoitiet_app/core/constants/constants.dart';
import '../../widget/column_chart.dart';
import '../../widget/hourly_forecard_item.dart';
import '../../widget/weather_forecast_item.dart';

class WeatherReportView extends ConsumerWidget {
  bool didRunDefaultData = false;
  WeatherReportView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listFavorites = ref.watch(weatherProvider);
    final reportModel = ref.watch(weatherReportProvider);

    // print(arguments['lon']);
    // print(arguments['lat']);

    WeatherModel? weatherModel = reportModel.weatherModel;
    bool isFavovite = reportModel.isFavoritesWeather;
    final handleTimeToNotifi = ref.watch(weatherFavoritesProvider);
    List<SettingNotificationModel> listSettingLocal =
        reportModel.listNotiOfWeather;
    ForestWeatherModel? forestWeatherModel = reportModel.forestWeatherModel;
    void addFavorites() async {
      listFavorites.weatherFavories.add(weatherModel!);
      listFavorites.insertFavoriteFromSQL(weatherModel);
      reportModel.setStateFavoriteWeather(true);
    }

    void removeWeatherInFavorites(WeatherModel data) async {
      reportModel.setStateFavoriteWeather(false);
      print('remove');
      for (WeatherModel item in listFavorites.weatherFavories) {
        if (item.coord!.lat.toString() == data.coord!.lat.toString() &&
            item.coord!.lon.toString() == data.coord!.lon.toString()) {
          listFavorites.weatherFavories.remove(item);
          break;
        }
      }
      listFavorites.deleteFavoriteFromSQL(data);
    }

    Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (!didRunDefaultData) {
      reportModel.setDefaultData(false);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (reportModel.defaultData) {
        return;
      }
      if (arguments != null) {
        var p_lon = arguments?['lon'];
        var p_lat = arguments?['lat'];
        if (p_lon != null && p_lat != null) {
          WeatherModel pram_weather =
              await listFavorites.getDetailWeather(p_lon, p_lat);
          await reportModel.setWeatherModel(pram_weather);
          print('thành công');
        }
      } else {
        await reportModel.setForestWeatherModel(weatherModel!);
        await reportModel.setListNotiOfWeather(weatherModel);
        await handleTimeToNotifi.getListSettingFromLocal(weatherModel);
      }
      didRunDefaultData = true;
      await reportModel.setFavoriteWeather();
      await reportModel.setDefaultData(true);
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
                              if (arguments != null) {
                                Navigator.pushNamed(context, 'main_tab');
                              } else {
                                Navigator.pop(context);
                              }
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
                          temp: weatherModel.temporary!.temp.toString(),
                          tempmin: weatherModel.temporary!.tempMin.toString(),
                          tempmax: weatherModel.temporary!.temmMax.toString(),
                          nameLocation: weatherModel.nameLocation.toString(),
                          urlStatusIcon: weatherModel
                              .listStatusWeather![0].urlStatusIcon
                              .toString(),
                          descriptionWeather: weatherModel
                              .listStatusWeather![0].desWeatherAttribute
                              .toString(),
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
                                ? IconButton(
                                    icon: const Icon(Icons.favorite,
                                        color: Colors.yellow),
                                    onPressed: () {
                                      removeWeatherInFavorites(weatherModel);
                                    },
                                  )
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
                              style: const TextStyle(color: Colors.yellow),
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
                        padding: EdgeInsets.only(bottom: 10, left: 10),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: Text(
                                        'Các thiết lập thông báo tại ${weatherModel.nameLocation}'),
                                    content: SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          20,
                                      height: 200,
                                      child: ListView.builder(
                                        itemCount: listSettingLocal.length,
                                        itemBuilder: (context, index) =>
                                            Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 5, left: 5),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    'Vào lúc:  ${listSettingLocal[index].hour} giờ, ${listSettingLocal[index].minute} phút'),
                                                IconButton(
                                                    onPressed: () {
                                                      reportModel
                                                          .setDefaultData(
                                                              false);
                                                      handleTimeToNotifi
                                                          .deleteSettingFromSQL(
                                                              listSettingLocal[
                                                                      index]
                                                                  .lon
                                                                  .toString(),
                                                              listSettingLocal[
                                                                      index]
                                                                  .lat
                                                                  .toString(),
                                                              listSettingLocal[
                                                                      index]
                                                                  .hour
                                                                  .toString(),
                                                              listSettingLocal[
                                                                      index]
                                                                  .minute
                                                                  .toString());
                                                      Navigator.pop(
                                                          context, 'Cancel');
                                                    },
                                                    icon: const Icon(
                                                      Icons.delete_forever,
                                                      color: Colors.red,
                                                    ))
                                              ]),
                                        ),
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
                                        child: const Text('Đóng'),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                ),
                                child: Row(
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
                                          style: const TextStyle(
                                              color: Colors.yellow),
                                        )),
                                  ],
                                ),
                              ),
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
                                      onTap: () => {
                                        handleTimeToNotifi
                                            .handleTimeNoti(weatherModel),
                                        reportModel.setDefaultData(false)
                                      },
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
                              itemCount: forestWeatherModel?.hourly?.length,
                              itemBuilder: (context, index) =>
                                  HourlyForecastItem(
                                hourly: forestWeatherModel!.hourly![index],
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
                                                ' ${forestWeatherModel?.currentWeather!.clouds.toString()}%',
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
                                                ' ${forestWeatherModel?.currentWeather!.feels_like.toString()}°',
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
                                                '${forestWeatherModel?.currentWeather!.wind_speed.toString()}m/s',
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
                                                '${forestWeatherModel?.currentWeather!.uvi.toString()} UV',
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
                                                '${forestWeatherModel?.currentWeather!.visibility.toString()} m',
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
                                                forestWeatherModel!
                                                        .daily![0]?.rain
                                                        ?.toString() ??
                                                    '0',
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
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        right: 20, left: 20, top: 50),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Ngày',
                                            style: TextStyle(
                                                color: Colors.yellow)),
                                        const SizedBox(width: 5),
                                        Text("Thời tiết",
                                            style: TextStyle(
                                                color: Colors.yellow)),
                                        const SizedBox(width: 20), //
                                        Text(
                                          "Max°C",
                                          style:
                                              TextStyle(color: Colors.yellow),
                                        ),
                                        Text("Min°C",
                                            style: TextStyle(
                                                color: Colors.yellow)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 500,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount:
                                            forestWeatherModel?.daily?.length,
                                        itemBuilder: (context, index) =>
                                            WeatherForecastItem(
                                          daily:
                                              forestWeatherModel!.daily![index],
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
                                "Khả năng nhiệt độ và lượng mưa ${weatherModel.nameLocation.toString()} ",
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: ColumnChart(
                              chartData1: reportModel
                                      .getChartData1(forestWeatherModel) ??
                                  [],
                              chartData2: reportModel
                                      .getChartData2(forestWeatherModel) ??
                                  [],
                            ),
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
