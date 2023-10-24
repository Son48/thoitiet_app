import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/constans/constains.dart';
import 'package:thoitiet_app/core/data/models/weather.dart';
import 'package:thoitiet_app/ui/view/base_view.dart';
import 'package:thoitiet_app/view_models/weather_home/weather_home_model.dart';

class WeatherHome extends BaseView {
  const WeatherHome({super.key});
  @override
  WeatherHomeView createState() => WeatherHomeView();
}

class WeatherHomeView extends BaseViewState<WeatherHome, WeatherHomeViewModel> {
  @override
  void createViewModel() {
    super.createViewModel();
    viewModel = WeatherHomeViewModel()..onInitViewModel(context);
  }

  @override
  Widget buildView(BuildContext context) {
    // TODO: implement build
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
                        'Thời tiết hôm nay',
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
                        height: 190,
                        child: ListView.builder(
                          itemCount: viewModel.weathers.length,
                          itemBuilder: (context, index) =>
                              CardWeather(viewModel.weathers[index]),
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ),
                  )

                  //
                  ,
                  const Padding(
                    padding: EdgeInsets.only(top: 30.0, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Địa điểm của bạn',
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
                  //slide card
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: SizedBox(
                        height: 150,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            CardBigWeather(),
                            CardBigWeather(),
                          ],
                        ),
                      ),
                    ),
                  )

                  //news
                  ,
                  const Padding(
                    padding: EdgeInsets.only(top: 70.0, right: 20),
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
                      return NewsCardItem();
                    },
                  )
                ],
              ),
            )),
      ))),
    );
  }

//news cart
  Container NewsCardItem() {
    return Container(
        height: 130,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //image new
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: SizedBox(
                  height: 110,
                  width: 110,
                  child: DecoratedBox(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(20), // Đặt bán kính bo tròn
                      child: Image.network(
                        'https://scontent.fsgn2-5.fna.fbcdn.net/v/t39.30808-6/394541329_889174202568674_4212189972633908426_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=5f2048&_nc_ohc=WykHN-qrtdMAX--Tb1s&_nc_ht=scontent.fsgn2-5.fna&oh=00_AfB-Ee-ND_ot7riCPEXqJNDYPdER1mWlPyrbq7ew5Ig3dA&oe=653B9D6F',
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
                              color: Colors.white, fontWeight: FontWeight.bold),
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
        ));
  }

//big card
  Container CardBigWeather() {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: AspectRatio(
        //w/h
        aspectRatio: 16 / 9,
        // Hero: lib animation when change screen at this point
        child: Hero(
          tag: 'hhuhuhu',
          //GestureDetector: define one tap in this component
          child: GestureDetector(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryPage(image: image, title: title, tag: tag,)));
            },
            child: Material(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                //background image in component
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/banner-card.png'),
                        fit: BoxFit.fill)),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient:
                          LinearGradient(begin: Alignment.bottomRight, colors: [
                        Colors.black.withOpacity(.2),
                        Colors.black.withOpacity(.0),
                      ])),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        width: 150,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 8.0, bottom: 10),
                                child: Text(
                                  "19°",
                                  style: TextStyle(
                                      fontSize: 40, color: Colors.white),
                                ),
                              ),
                              Text(
                                "H.24° L:18°",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white70),
                              ),
                              Text(
                                "Hải Châu, Đà Nẵng",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ]),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: 90,
                            child: Image.network(
                                'https://openweathermap.org/img/wn/02d.png',
                                fit: BoxFit.fitWidth),
                          ),
                          const Text(
                            'Mưa nhẹ',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

//top card
  Container CardWeather(WeatherModel data) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: AspectRatio(
        //w/h
        aspectRatio: 3 / 4,
        // Hero: lib animation when change screen at this point
        child: Hero(
          tag: 'hhuhuhu',
          //GestureDetector: define one tap in this component
          child: GestureDetector(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryPage(image: image, title: title, tag: tag,)));
            },
            child: Material(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                //background image in component
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient:
                          LinearGradient(begin: Alignment.bottomRight, colors: [
                        Colors.black.withOpacity(.2),
                        Colors.black.withOpacity(.0),
                      ])),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data.nameLocation.toString(),
                                style: TextStyle(color: Colors.white)),
                            Text('90%',
                                style: TextStyle(color: Colors.white70)),
                          ],
                        ),
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: Image.network(
                              'https://openweathermap.org/img/wn/02d.png',
                              fit: BoxFit.fitWidth),
                        ),
                        const Text(
                          'Nhiều mây',
                          style: TextStyle(color: Colors.white),
                        ),
                        const Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              '31 - 38',
                              style: TextStyle(
                                color: Colors.white70,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  //end
}
