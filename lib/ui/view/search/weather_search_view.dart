import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/core/constants/constants.dart';
import 'package:thoitiet_app/ui/widget/card_big_weather.dart';
import 'package:thoitiet_app/view_models/weather_home/weather_home_model.dart';

import '../../../core/data/models/location.dart';
import '../../../view_models/weather_search/weather_search_model.dart';
import '../../widget/card_history.dart';
import '../../widget/card_search.dart';

class WeatherSearch extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherSearchModel = ref.watch(weatherSearchProvider);
    List<Location> rs_search = weatherSearchModel.weatherSearch;
    List<Location> h_search = weatherSearchModel.weatherHistory;
    final weatherModel = ref.watch(weatherProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (weatherSearchModel.defaultData) {
        return;
      }
      weatherSearchModel.setDefaultData(true);
      weatherSearchModel.setSearchQuery('');
      weatherSearchModel.setController('');
      weatherSearchModel.getAllSearchFromSQLAndSetState();
    });

    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onHorizontalDragEnd: (details) =>
              weatherSearchModel.handleHorizontalSwipe(details, context),
          child: SingleChildScrollView(
            child: Material(
              color: Colors.blue,
              child: Container(
                decoration: const BoxDecoration(
                    gradient:
                        LinearGradient(begin: Alignment.bottomRight, colors: [
                  colorBackground,
                  Color.fromRGBO(9, 98, 169, 1),
                  Color.fromRGBO(9, 100, 169, 1),
                  Color.fromRGBO(9, 98, 140, 1)
                ])),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            weatherSearchModel.setController('');
                            weatherSearchModel.setSearchQuery('');
                            Navigator.pop(context);
                          },
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: TextField(
                              controller: weatherSearchModel.getController,
                              onChanged: (newText) =>
                                  weatherSearchModel.handleSearch(newText),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: "Tìm kiếm ....",
                                prefixIcon: const Icon(Icons.search),
                                prefixIconColor: Colors.black,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 12.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SizedBox(
                            height: 170,
                            child: SingleChildScrollView(
                              physics: AlwaysScrollableScrollPhysics(),
                              child: Column(
                                children: [
                                  // Display "Gần đây" if the recent search results are empty
                                  rs_search.isEmpty &&
                                          h_search.isNotEmpty &&
                                          weatherSearchModel.searchQuery.isEmpty
                                      ? Container(
                                          alignment: Alignment.topLeft,
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: const Text(
                                            "Gần đây",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      : Container(),
                                  // List view for displaying search results
                                  rs_search.isEmpty &&
                                              h_search.isEmpty &&
                                              weatherSearchModel
                                                  .searchQuery.isNotEmpty ||
                                          rs_search.isEmpty &&
                                              h_search.isNotEmpty &&
                                              weatherSearchModel
                                                  .searchQuery.isNotEmpty
                                      ? Center(
                                          child: Container(
                                            child: Text(
                                              "Không tìm thấy kết quả: '${weatherSearchModel.searchQuery}'",

                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.yellow,
                                              ),
                                            ),
                                          ),
                                        )
                                      : ListView.builder(
                                          itemCount: rs_search.isNotEmpty
                                              ? rs_search.length
                                              : h_search.length,
                                          itemBuilder: (context, index) {
                                            return rs_search.isNotEmpty
                                                ? CardSearch(
                                                    data: rs_search[index])
                                                : CardHistory(
                                                    data: h_search[index]);
                                          },
                                          scrollDirection: Axis.vertical,
                                    physics: NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                        ),
                                  //recommend
                                  const Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Gợi ý cho bạn',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //slide card
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 10, bottom: 20),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: SizedBox(
                                        height: 170,
                                        child: ListView.builder(
                                          itemCount: weatherModel
                                              .weathersRecommend.length,
                                          itemBuilder: (context, index) =>
                                              CardBigWeather(
                                                  data: weatherModel
                                                      .weathersRecommend[index]),
                                          scrollDirection: Axis.horizontal,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
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
