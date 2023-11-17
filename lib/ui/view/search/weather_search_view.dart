import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitiet_app/core/constants/constants.dart';

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
          onHorizontalDragEnd: (DragEndDetails details){
            if (details.primaryVelocity! > 0) {
              // Bạn có thể kiểm tra xem bàn phím có mở hay không
              if (FocusManager.instance.primaryFocus?.hasFocus ?? false) {
                // Nếu bàn phím mở, đóng nó
                FocusManager.instance.primaryFocus?.unfocus();
                // Kiểm tra xem đã thoát khỏi màn hình tìm kiếm hay chưa
                if (Navigator.canPop(context)) {
                  // Nếu đã thoát khỏi màn hình tìm kiếm, xóa nội dung trên search
                  weatherSearchModel.setSearchQuery('');
                  weatherSearchModel.setController('');
                }
              } else {
                // Nếu bàn phím không mở, thoát khỏi màn hình tìm kiếm
                Navigator.pop(context);
              }
            }
          },
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
                                  borderRadius: BorderRadius.circular(30),
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
                            child: Column(
                              children: [
                                // Display "Gần đây" if the recent search results are empty
                                rs_search.isEmpty &&
                                        h_search.isNotEmpty &&
                                        weatherSearchModel.searchQuery.isEmpty
                                    ? Container(
                                        alignment: Alignment.topLeft,
                                        padding: const EdgeInsets.only(left: 10),
                                        child: const Text(
                                          "Gần đây",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.orange,
                                          ),
                                        ),
                                      )
                                    : Container(),
                                // List view for displaying search results
                                rs_search.isEmpty &&h_search.isNotEmpty&& weatherSearchModel.searchQuery.isNotEmpty
                                    ? Center(
                                        child: Container(
                                          child: Text(
                                            "Không tìm thấy kết quả cho '${weatherSearchModel.searchQuery}'",
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.orange,
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
                                              ? CardSearch(data: rs_search[index])
                                              : CardHistory(
                                                  data: h_search[index]);
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
      ),
    );
  }
}
