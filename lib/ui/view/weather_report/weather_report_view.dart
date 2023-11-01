import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/constans/constains.dart';
import 'package:thoitiet_app/ui/widget/cross_text.dart';
import 'package:thoitiet_app/ui/widget/transparent_button.dart';
import 'package:thoitiet_app/ui/widget/weather_report_item.dart';

import '../../widget/crossed_out_text.dart';
import '../../widget/hourly_forecard_item.dart';
import '../../widget/detail_bottom_sheet.dart';

class WeatherReportView extends ConsumerWidget {
  const WeatherReportView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
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
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Thời tiết Hà Nội',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: const Icon(
                        Icons.home_outlined,
                        size: 32,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.search,
                        size: 32,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width -
                      20, // Thay đổi kích thước container tại đây
                  height: MediaQuery.of(context).size.height *
                      0.25, // Thay đổi kích thước container tại đây
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0), // Độ bo tròn
                    border: Border.all(
                      color: Colors.white, // Màu đường viền
                      width: 1.0, // Độ dày đường viền
                    ),
                  ),
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Mưa vừa",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "13:30 • 12/08",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "31°",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            heightFactor: 30,
                            child: Image.network(
                                "https://openweathermap.org/img/wn/09d@4x.png",
                                fit: BoxFit.fitWidth),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 100.0 / 2.5,
                        // Đặt vị trí đường kẻ ngang ở 1/3 chiều cao
                        left: 10.0,
                        right: 10.0,
                        child: Container(
                          height: 1.0, // Độ dày của đường kẻ
                          color: Colors.white, // Màu của đường kẻ
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CrossedText(
                                    text: "Chi tiết",
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (context) {
                                          return DetailBottomSheet(
                                            text1: '30%',
                                            icon: Icons.ac_unit,
                                            text2: '5:00',
                                            title: 'Cảm giác như',
                                            onClose: () {
                                              Navigator.of(context).pop();
                                            },
                                            remind: '',
                                          ); // Hiển thị màn hình chi tiết ở đây
                                        },
                                      );
                                    }),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //container 2
                Material(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width -
                        20, // Thay đổi kích thước container tại đây
                    height: MediaQuery.of(context).size.height *
                        0.33, // Thay đổi kích thước container tại đây
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0), // Độ bo tròn
                        gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            colors: [
                              Colors.black.withOpacity(.2),
                              Colors.black.withOpacity(.0),
                            ])),
                    child: Stack(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Thời Tiết 24h tới",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 100.0 / 1.8,
                          // Đặt vị trí đường kẻ ngang ở 1/3 chiều cao
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 1.0, // Độ dày của đường kẻ
                            color: Colors.white, // Màu của đường kẻ
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 70),
                          child: SizedBox(
                            height: 180,
                            child: ListView.builder(
                              itemCount: 4,
                              itemBuilder: (context, index) =>
                                  const HourlyForecastItem(
                                time: "12:00",
                                temperature: "25°C",
                                imageUrl:
                                    "https://openweathermap.org/img/wn/09d@4x.png",
                              ),
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                //chat luong ko khi
                Material(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: MediaQuery.of(context).size.width -
                        20, // Thay đổi kích thước container tại đây
                    height: MediaQuery.of(context).size.height *
                        0.23, // Thay đổi kích thước container tại đây
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0), // Độ bo tròn
                        gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            colors: [
                              Colors.black.withOpacity(.2),
                              Colors.black.withOpacity(.0),
                            ])),
                    child: Stack(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.air,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Chất lượng không khí",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Trung Bình",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 100.0 / 2,
                          // Đặt vị trí đường kẻ ngang ở 1/3 chiều cao
                          left: 10.0,
                          right: 10.0,
                          child: Container(
                            height: 1.0, // Độ dày của đường kẻ
                            color: Colors.white, // Màu của đường kẻ
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  CrossedText(
                                      text: "Chi tiết",
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (context) {
                                            return DetailBottomSheet(
                                              text1: '30%',
                                              icon: Icons.ac_unit,
                                              text2: '5:00',
                                              title: 'Cảm giác như',
                                              onClose: () {
                                                Navigator.of(context).pop();
                                              },
                                              remind:
                                                  'Không tốt cho người nhạy cảm. Nhóm người nhạy cảm có thể chịu ảnh hưởng sức khỏe. Số đông không có nguy cơ bị tác động',
                                            ); // Hiển thị màn hình chi tiết ở đây
                                          },
                                        );
                                      }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Material(
                  color: Colors.blue,
                  child: Container(
                    width: MediaQuery.of(context)
                        .size
                        .width, // Thay đổi kích thước container tại đây
                    height: MediaQuery.of(context).size.height *
                        0.45, // Thay đổi kích thước container tại đây
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            colors: [
                          Colors.black.withOpacity(.2),
                          Colors.black.withOpacity(.0),
                        ])),
                    child: Stack(
                      children: [
                        const Padding(
                            padding: EdgeInsets.all(10.0), child: Row()),
                        Positioned(
                          top: 100.0 / 1.8,
                          // Đặt vị trí đường kẻ ngang ở 1/3 chiều cao
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 0.2, // Độ dày của đường kẻ
                            color: Colors.white, // Màu của đường kẻ
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 80),
                          child: SizedBox(
                            height: 224,
                            child: ListView.builder(
                              itemCount: 4,
                              itemBuilder: (context, index) =>
                                  const WeatherReportItem(
                                time: "12:00",
                                temperature: "25°C",
                                imageUrl:
                                    "https://openweathermap.org/img/wn/09d@4x.png",
                                status: "Mưa",
                                possibility: "80%",
                              ),
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CrossedOutText(
                                text: 'Thời tiết các khu vực ở Hà Nội',
                                onTap: () {
                                  // Xử lý sự kiện khi chữ được nhấp
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TransparentButton(
                      icon: Icons.sunny_snowing,
                      text1: "https://thoitiet.vn",
                      text2: "Thời tiết Việt Nam",
                      onPressed: () {}),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
