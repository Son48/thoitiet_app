import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/constans/constains.dart';
import 'package:thoitiet_app/core/data/notificatons/notification_services.dart';

class SettingHome extends ConsumerWidget {
  const SettingHome({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //render ui before, add data
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Cài đặt cấp phép quyền: ',
                              style: TextStyle(color: Colors.white),
                            ),
                            Row(
                              // mainAxisAlignment:
                              //     MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    //send daily notification 16h 31p

                                    print('clik');
                                    NotificationService().showNotification(
                                      id: 0,
                                      title: 'Notification Title',
                                      body: 'Notification Body',
                                      scheduledTimeHour: 13,
                                      scheduledTimeMinute: 18,
                                    );
                                  },
                                  child: const Text(
                                    'LUÔN CHO PHÉP',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Cài đặt chi đó nữa: ',
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
