import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/data/models/location.dart';
import '../../view_models/weather_report_model/weather_report_model.dart';
import '../../view_models/weather_search/weather_search_model.dart';

class CardHistory extends ConsumerWidget {
  final Location data;

  CardHistory({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get a reference to weatherReportProvider
    final reportModel = ref.watch(weatherReportProvider);
    // Get a reference to weatherSearchProvider
    final searchModel = ref.watch(weatherSearchProvider);
    void handleClickCardHistory() {
      // Set the location for weatherReportModel
      reportModel.setLocation(data);
      reportModel.setDefaultData(false);
      // Navigate to the weather detail page
      Navigator.pushNamed(context, 'detail-weather');
      // Reset the default values of weatherSearchModel
      searchModel.setDefaultData(false);
      // Add the location to the favorites list in weatherSearchModel
      searchModel.insertFavoriteFromSQL(data);
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: GestureDetector(
          onTap: () {
            handleClickCardHistory();
          },
          child: Container(
            width: MediaQuery.of(context).size.width - 5,
            height: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        data.nameLocation.toString(),
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      // Delete the location from favorites list in weatherSearchModel
                      searchModel.deleteFavoriteFromSQL(data);
                    },
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.white,
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
