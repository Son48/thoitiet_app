import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/core/constants/constants.dart';
import 'dart:math';

bool isLoadingWeather = true;
bool isLoadingWeatherFavorites = true;

class NewsHome extends ConsumerWidget {
  const NewsHome({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                              Icons.search,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
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
                      width: 80,
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

class PreLoading extends StatelessWidget {
  const PreLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(9, 98, 169, 1),
      child: const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          strokeWidth: 2.0,
        ),
      ),
    );
  }
}
