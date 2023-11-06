import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/constans/constains.dart';

import '../../widget/card_view.dart';

class WeatherSearch extends ConsumerWidget {
  const WeatherSearch({super.key});

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
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: SizedBox(
                      height: 160,
                      child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return const CardBigWeather(
                              tag: '1',
                              temp: '1',
                              tempmin: '1',
                              tempmax: '1',
                              nameLocation: 'da nang',
                              urlStatusIcon: '09',
                              descriptionWeather: 'mưa vừa',
                            );
                          }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ))),
    );
  }
}
