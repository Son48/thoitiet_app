import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:thoitiet_app/core/data/models/location.dart';
import 'package:thoitiet_app/view_models/weather_search/weather_search_model.dart';
import '../../view_models/weather_report_model/weather_report_model.dart';

class CardSearch extends ConsumerWidget {
  Location data;

  CardSearch({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportModel = ref.watch(weatherReportProvider);
    final searchModel = ref.watch(weatherSearchProvider);
    String searchQuery = searchModel.searchQuery;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: GestureDetector(
          onTap: () {
            reportModel.setLocation(data);
            Navigator.pushNamed(context, 'detail-weather');
            searchModel.setDefaultData(false);
          },
          child: Material(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: MediaQuery.of(context).size.width - 5,
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(.2),
                      Colors.black.withOpacity(.0),
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(Icons.search),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              data.nameLocation.toString(),
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
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
