import 'dart:math';

import 'package:flutter/material.dart';
import 'package:thoitiet_app/constans/constains.dart';

class NewsWeather extends StatelessWidget {
  const NewsWeather({super.key});

  @override
  Widget build(BuildContext context) {
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
                        'Bản tin thời tiết',
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
                              Icons.home_outlined,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
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

                  //news view
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 10),
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 10, top: 20, right: 10, bottom: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              const Text(
                                "Dự báo thời tiết Đà Nẵng ngày 26/10/2023, IT thật mệt mỏi :))",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                                textAlign: TextAlign.left,
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 10, bottom: 20),
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        width: 0.5,
                                        color: const Color.fromARGB(
                                            255, 225, 139, 139))),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 40,
                                      child: Image.network(
                                        fit: BoxFit.fitHeight,
                                        'https://openweathermap.org/img/wn/02d.png',
                                      ),
                                    ),
                                    Text('26/10/2023 - Tổng Hợp'),
                                  ],
                                ),
                              ),
                              const Text(
                                "Dự báo thời tiết các khu vực trong 24 đến 48 giờ tới\n"
                                "- Bắc Bộ:\n"
                                "+ Đêm 26 ngày 27/10: đêm có mưa vài nơi, ngày nắng.\n"
                                "+ Chiều tối và đêm 27 ngày 28/10: có mưa rào và dông rải rác, riêng vùng núi cục bộ có mưa vừa, mưa to.\n"
                                "- Khu vực Trung Bộ: chiều tối và đêm có mưa rào và dông vài nơi, ngày nắng.\n"
                                "- Tây Nguyên và Nam Bộ: có mưa rào và dông vài nơi, riêng chiều và tối ngày 27/10 có mưa rào và dông rải rác, cục bộ có mưa vừa, mưa to.\n"
                                "Trong mưa dông có khả năng xảy ra lốc, sét, mưa đá và gió giật mạnh, lũ quét trên các sông, suối nhỏ, sạt lở đất trên sườn dốc.\n\n"
                                "Nhận định hình thế thời tiết từ đêm 28/10 đến ngày 05/11\n"
                                "- Bắc Bộ và Thanh Hóa: từ đêm 28-29/10, có mưa rào và dông rải rác, cục bộ có mưa vừa, mưa to.\n"
                                "- Khu vực Nghệ An và Hà Tĩnh: khoảng chiều tối và đêm 29-30/10 có mưa rào và dông rải rác, cục bộ có mưa vừa, mưa to.\n"
                                "- Khu vực Trung Trung Bộ: từ đêm 29/10-03/11 có mưa rào và dông rải rác, cục bộ có mưa vừa, mưa to.\n"
                                "Trong mưa dông có khả năng xảy ra lốc, sét, mưa đá và gió giật mạnh, lũ quét trên các sông, suối nhỏ, sạt lở đất trên sườn dốc.",
                              ),
                              Image.network(
                                  'https://www.elle.vn/wp-content/uploads/2017/07/25/hinh-anh-dep-1.jpg')
                            ],
                          )),
                    ),
                  ),
                  //news,
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0, right: 20),
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
          tag: Random().nextInt(999).toString(),
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
                      width: 110,
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
                  child: const SizedBox(
                    width: 230,
                    height: 100,
                    child: Column(
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

  //end
}
