import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:thoitiet_app/ui/widget/column_chart.dart';
import 'package:thoitiet_app/ui/widget/weather_forecast_item.dart';

import '../../constans/constains.dart';
import '../widget/linear_chart.dart';
import '../widget/transparent_button.dart';

class WeatherForecastView extends ConsumerWidget {
  const WeatherForecastView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ForeCastData> getChartData1() {
      final List<ForeCastData> chartData1 = [
        ForeCastData('CN','13','27'),
        ForeCastData('T2','14','33'),
        ForeCastData('T3','15','35'),
        ForeCastData('T4','16','35'),
        ForeCastData('T5','17','28'),
        ForeCastData('T6','18','34'),
      ];
      return chartData1;
    }

    List<ForeCastData> getChartData2() {
      final List<ForeCastData> chartData2 = [
        ForeCastData('CN','13','88'),
        ForeCastData('T2','14','76'),
        ForeCastData('T3','15','76'),
        ForeCastData('T4','16','70'),
        ForeCastData('T5','17','92'),
        ForeCastData('T6','18','54'),
      ];
      return chartData2;
    }
    List<ForeCastData1> getChartData() {
      final List<ForeCastData1> chartData = [
        ForeCastData1('CN','13','3.45'),
        ForeCastData1('T2','14','6.91'),
        ForeCastData1('T3','15','7.02'),
        ForeCastData1('T4','16','3.74'),
        ForeCastData1('T5','17','4.03'),
        ForeCastData1('T6','18','14.14'),
      ];
      return chartData;
    }
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                colorBackground,
                Color.fromRGBO(9, 98, 169, 1),
                Color.fromRGBO(9, 100, 169, 1),
                Color.fromRGBO(9, 98, 140, 1),
              ],
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 30,
                    bottom: 50,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Thời tiết 3 ngày tới",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Hà Nội",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Material(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 20,
                    height: MediaQuery.of(context).size.height * 0.6,
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.56,
                              width: MediaQuery.of(context).size.height * 0.56,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: ListView.builder(
                                  itemCount: 7,
                                  itemBuilder: (context, index) => WeatherForecastItem(
                                    time: "Hôm nay",
                                    temperature1: "25°C",
                                    temperature2: "13°C",
                                    imageUrl: "https://openweathermap.org/img/wn/09d@4x.png",
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Container(
                    width: MediaQuery.of(context).size.width - 20,
                    height: MediaQuery.of(context).size.height * 0.533,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all( // Đặt viền cho khung chữ nhật
                        color: Colors.transparent, // Màu viền
                        width: 1.0, // Độ rộng của viền
                      ),
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(0),
                            child: Text("Khả năng mưa Hà Nội những ngày tới",textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 13),),
                          ),
                        ),
                        LineChart(
                          chartData1: getChartData1(),
                          chartData2: getChartData2(),
                        ),
                      ],
                    ),
                  ),

                SizedBox(height: 30,),
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: MediaQuery.of(context).size.height * 0.533,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all( // Đặt viền cho khung chữ nhật
                      color: Colors.transparent, // Màu viền
                      width: 1.0, // Độ rộng của viền
                    ),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Text("Lượng mưa Hà Nội những ngày tới",textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 13),),
                        ),
                      ),
                      ColumnChart(
                        chartData: getChartData(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TransparentButton(
                      icon: Icons.sunny_snowing,
                      text1: "https://thoitiet.vn",
                      text2: "Thời tiết Việt Nam",
                      onPressed: () {}),
                ),
                SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
