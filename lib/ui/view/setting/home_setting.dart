import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/core/constants/constants.dart';
import 'package:thoitiet_app/core/data/models/setting_notifi.dart';
import 'package:thoitiet_app/core/data/notificatons/notification_services.dart';
import 'package:thoitiet_app/ui/view/news/home_news_weather.dart';
import 'package:thoitiet_app/view_models/Setting_Notification/setting_notification_model.dart';
import 'package:workmanager/workmanager.dart';

class SettingHome extends ConsumerWidget {
  const SettingHome({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('render setting');
    //render ui before, add data
    final handleTimeToNotifi = ref.watch(weatherFavoritesProvider);
    List<SettingNotificationModel> listAllSettingNoti =
        handleTimeToNotifi.listAllSetting;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (handleTimeToNotifi.loadSetting) {
        return;
      }
      handleTimeToNotifi.getAllSettingFromLocal();
      handleTimeToNotifi.setLoadSetting(true);
    });
    //fucntion return widget and delete setting in db
    Widget ItemSettingNoti(SettingNotificationModel setting) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 200,
              child: Text(
                '*Thông báo ${setting.nameLocation} vào lúc: ',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      '${setting.hour} giờ ',
                      style: const TextStyle(color: Colors.yellow),
                    ),
                    Text(
                      '${setting.minute} phút ',
                      style: const TextStyle(color: Colors.yellow),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      handleTimeToNotifi.deleteSettingFromSQL(
                          setting.lon.toString(),
                          setting.lat.toString(),
                          setting.hour.toString(),
                          setting.minute.toString());
                    },
                    icon: Icon(
                      Icons.cancel_outlined,
                      color: Colors.orange[500],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: (Scaffold(
          body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
          colorBackground,
          Color.fromRGBO(9, 98, 169, 1),
          Color.fromRGBO(9, 100, 169, 1),
          Color(0xFF09628C)
        ])),
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            // shrinkWrap: false,
            child: Padding(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    const Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Thông tin của bạn',
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        )),
                    //INFORMATION ACCOUNT
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 80,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                "https://yt3.ggpht.com/ytc/APkrFKaOsPZ7nFqX1mb_RGFSRzy9-V_2ouAExLK4xltjLQ=s88-c-k-c0x00ffffff-no-rj",
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Tên của bạn: Nguyễn Hải Dương',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Nơi sống hiện tại: Đà Nẵng',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Id tài khoản: @124sdfzsdfwae',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Thiết lập của bạn',
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )),
                    )
                    //setting
                    ,
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: listAllSettingNoti.length,
                                itemBuilder: (context, index) =>
                                    ItemSettingNoti(listAllSettingNoti[index]),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Cài đặt thông báo: ',
                            style: TextStyle(color: Colors.white),
                          ),
                          Row(
                            // mainAxisAlignment:
                            //     MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'LUÔN CHO PHÉP',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 40,
                                child: IconButton(
                                  onPressed: () => {},
                                  icon: const Icon(
                                    size: 20,
                                    Icons.arrow_right,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Cài đặt gì đó: ',
                            style: TextStyle(color: Colors.white),
                          ),
                          Row(
                            // mainAxisAlignment:
                            //     MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'LUÔN CHO PHÉP',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 40,
                                child: IconButton(
                                  onPressed: () => {},
                                  icon: const Icon(
                                    size: 20,
                                    Icons.arrow_right,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Row(
                      // mainAxisAlignment:
                      //     MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 40,
                          child: IconButton(
                            onPressed: () => {},
                            icon: const Icon(
                              size: 14,
                              Icons.info_outline,
                              color: Color.fromARGB(255, 253, 221, 41),
                            ),
                          ),
                        ),
                        const Text(
                          'Lưu í gì đó...',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )),
      ))),
    );
  }

  //end
}
