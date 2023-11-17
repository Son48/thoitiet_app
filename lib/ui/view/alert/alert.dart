import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/core/constants/constants.dart';
import 'package:thoitiet_app/core/data/models/Notification.dart';
import 'dart:math';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:thoitiet_app/core/data/models/weather.dart';

import 'package:thoitiet_app/view_models/Alert/NotificationModel.dart';
import 'package:thoitiet_app/view_models/weather_home/weather_home_model.dart';
import 'package:thoitiet_app/view_models/weather_report_model/weather_report_model.dart';

bool isLoadingWeather = true;
bool isLoadingWeatherFavorites = true;

class AlertView extends ConsumerWidget {
  const AlertView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('render');
    final notificaitonModel = ref.watch(notificationModelProvider);
    final reportModel = ref.watch(weatherReportProvider);
    final weatherModel = ref.watch(weatherProvider);

    //set the first value
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (notificaitonModel.defaultData) {
        return;
      }
      notificaitonModel.setDefaultData(true);
      notificaitonModel.getAllNotificationUser();
    });
    Future<void> refreshNotidata() async {
      await notificaitonModel.setDefaultData(false);
    }

    void detailWeather(NotificationModel notification) async {
      WeatherModel weather = await weatherModel.getDetailWeather(
          notification.lon.toString(), notification.lat.toString());
      await reportModel.setWeatherModel(weather);
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, 'detail-weather');
      print('hellio');
    }

//news cart
    Widget AlertCard(NotificationModel notification, BuildContext context) {
      return GestureDetector(
        onTap: () => detailWeather(notification),
        child: Slidable(
          // Specify a key if the Slidable is dismissible.
          key: ValueKey(notification.dateTime.toString() +
              Random().nextInt(999).toString()),

          // The start action pane is the one at the left or the top side.
          startActionPane: ActionPane(
            // A motion is a widget used to control how the pane animates.
            motion: const ScrollMotion(),

            // A pane can dismiss the Slidable.
            dismissible: DismissiblePane(onDismissed: () {
              notificaitonModel.deleteNotification(notification);
            }),

            // All actions are defined in the children parameter.
            children: [
              // A SlidableAction can have an icon and/or a label.
              SlidableAction(
                onPressed: (context) =>
                    {notificaitonModel.deleteNotification(notification)},
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.red[400],
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          // The end action pane is the one at the right or the bottom side.
          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) =>
                    {notificaitonModel.deleteNotification(notification)},
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.red[400],
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),

          child: Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(children: [
                //image new
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 6, 196, 187),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: SizedBox(
                      height: 80,
                      width: 80,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(10), // Đặt bán kính bo tròn
                          child: Image.network(
                            'https://openweathermap.org/img/wn/${notification.urlIcon.toString()}.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //detail
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          'Thời tiết tại ${notification.nameLocation.toString()} lúc ${notification.hour}h ${notification.minute}p',
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        width: 190,
                        child: Text('Ngày ${notification.dateTime.toString()}',
                            style: const TextStyle(
                                color: Colors.white54, fontSize: 12)),
                      ),
                      SizedBox(
                        width: 190,
                        child: Text('${notification.alert.toString()}',
                            style: const TextStyle(color: Colors.white70)),
                      ),
                      const Text(
                        'Xem thời tiết hiện tại',
                        style: TextStyle(color: Colors.yellow),
                      )
                    ],
                  ),
                )
              ]),
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () => refreshNotidata(),
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
                          'Thông báo của bạn',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                size: 32,
                                Icons.search,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                    //card alert
                    ListView.builder(
                      // scrollDirection: f,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: notificaitonModel.listNotificaitonModel.length,
                      itemBuilder: (context, index) => AlertCard(
                          notificaitonModel.listNotificaitonModel[index],
                          context),
                    ),
                    //news
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
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
                          Text('Xem tất cả',
                              style: TextStyle(
                                  fontSize: 17,
                                  decoration: TextDecoration.underline,
                                  color: Colors.white70)),
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
      ),
    );
  }

  //end
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
                  height: 100,
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
