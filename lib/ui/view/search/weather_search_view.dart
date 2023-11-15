import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/ui/widget/card_search.dart';
import 'package:thoitiet_app/view_models/weather_search/weather_search_model.dart';
import 'package:thoitiet_app/core/data/models/location.dart';

import '../../../core/constants/constants.dart';
import '../../widget/card_history.dart';

class WeatherSearch extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherSearchModel = ref.watch(weatherSearchProvider);
    List<Location> rs_search = weatherSearchModel.weatherSearch;
    List<Location> h_search = weatherSearchModel.weatherHistory;
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
        body: SingleChildScrollView(
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
                        icon: Icon(Icons.arrow_back, color: Colors.grey),
                        onPressed: () {
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
                              fillColor: Colors.grey,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                              hintText: "Search weather....",
                              prefixIcon: const Icon(Icons.search),
                              prefixIconColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(
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
                          child: ListView.builder(
                            itemCount: rs_search.isNotEmpty ? rs_search.length : h_search.length,
                            itemBuilder: (context, index) {
                              return rs_search.isNotEmpty
                                  ? CardSearch(data: rs_search[index])
                                  : CardHistory(data: h_search[index]);
                            },
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
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
    );
  }
}
