import 'package:flutter/material.dart';
class CardReport extends StatelessWidget {
  const CardReport({super.key, required this.tag, required this.temp, required this.tempmin, required this.tempmax, required this.nameLocation, required this.urlStatusIcon, required this.descriptionWeather});

  final String tag;
  final String temp;
  final String tempmin;
  final String tempmax;
  final String nameLocation;
  final String urlStatusIcon;
  final String descriptionWeather;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width-20,
        height: MediaQuery.of(context).size.height*0.5,
        // Hero: lib animation when change screen at this point
        child: Hero(
          tag: tag,
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
                      SizedBox(
                        width: 150,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.only(top: 8.0, bottom: 10),
                                child: Text(
                                  temp,
                                  style: const TextStyle(
                                      fontSize: 40, color: Colors.white),
                                ),
                              ),
                              Text(
                                "${tempmin}° - ${tempmax}°",
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.white70),
                              ),
                              Text(
                                nameLocation,
                                style: const TextStyle(
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
                                "https://openweathermap.org/img/wn/${urlStatusIcon}.png",
                                fit: BoxFit.fitWidth),
                          ),
                          Text(
                            descriptionWeather,
                            style: const TextStyle(color: Colors.white),
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
    );
  }
}
