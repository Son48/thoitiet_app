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
    // Watch the WeatherSearchViewModel using Riverpod
    final weatherSearchModel = ref.watch(weatherSearchProvider);
    List<Location> rs_search = weatherSearchModel.weatherSearch;
    List<Location> h_search = weatherSearchModel.weatherHistory;

    // Execute code after the frame is displayed
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Check if default data should be used
      if (weatherSearchModel.defaultData) {
        return;
      }

      // Set default data and clear search query and controller
      weatherSearchModel.setDefaultData(true);
      weatherSearchModel.setSearchQuery('');
      weatherSearchModel.setController('');

      // Fetch and set search history from SQLite
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
                  // Search bar with back button
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
                  // Container for displaying search results
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
                          child: Column(
                            children: [
                              // Display "Gần đây" if the recent search results are empty
                              rs_search.isEmpty
                                  ? Container(
                                      alignment: Alignment.topLeft,
                                      padding: const EdgeInsets.only(left: 10),
                                      child: const Text("Gần đây",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    )
                                  : Container(),
                              // List view for displaying search results
                              ListView.builder(
                                itemCount: rs_search.isNotEmpty
                                    ? rs_search.length
                                    : h_search.length,
                                itemBuilder: (context, index) {
                                  return rs_search.isNotEmpty
                                      ? CardSearch(data: rs_search[index])
                                      : CardHistory(data: h_search[index]);
                                },
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                              ),
                            ],
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
