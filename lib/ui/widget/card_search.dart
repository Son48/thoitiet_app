import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:thoitiet_app/core/data/models/location.dart';
import 'package:thoitiet_app/view_models/weather_search/weather_search_model.dart';
import '../../core/data/models/weather.dart';
import '../../view_models/weather_report_model/weather_report_model.dart';

class CardSearch extends ConsumerWidget {
  final Location data;

  CardSearch({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get a reference to weatherReportProvider
    final reportModel = ref.watch(weatherReportProvider);
    // Get a reference to weatherSearchProvider
    final searchModel = ref.watch(weatherSearchProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: GestureDetector(
          onTap: () {
            // Set the location for weatherReportModel
            reportModel.setLocation(data);
            // Navigate to the weather detail page
            Navigator.pushNamed(context, 'detail-weather');
            // Reset the default values of weatherSearchModel
            searchModel.setDefaultData(false);
            // Add the location to the favorites list in weatherSearchModel
            searchModel.insertFavoriteFromSQL(data);
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.search),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            data.nameLocation.toString(),
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black,
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
