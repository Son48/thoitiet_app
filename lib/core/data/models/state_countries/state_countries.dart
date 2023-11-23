import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:thoitiet_app/core/data/models/locationJSON/locationJSON.dart';

part 'state_countries.freezed.dart';
part 'state_countries.g.dart';

@freezed
class StateCountriesModel with _$StateCountriesModel {
  factory StateCountriesModel(
          {@JsonKey(name: 'stateCountry') String? stateContries,
          @JsonKey(name: 'locations') List<LocationJSONModel>? locations}) =
      _StateCountriesModel;
  factory StateCountriesModel.fromJson(Map<String, Object?> json) =>
      _$StateCountriesModelFromJson(json);
}
