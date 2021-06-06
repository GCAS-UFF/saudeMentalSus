import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:saude_mental_sus/core/error/exception.dart';
import 'package:saude_mental_sus/core/resources/keys.dart';
import 'package:saude_mental_sus/data/models/search_result_model.dart';
import 'package:saude_mental_sus/data/models/service_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../interfaces/maps_local_data_source.dart';

class MapsLocalDataSourceImpl extends MapsLocalDataSource {
  final SharedPreferences sharedPreferences;
  Map<String, List<ServiceModel>>? cityServicesInformation;

  MapsLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<SearchResultModel>> searchServices(String searchString) async {
    try {
      if (cityServicesInformation == null) {
        //Instantiate empty map
        cityServicesInformation = {};
        //Get json from sharedPreferences
        String value = sharedPreferences.getString(Keys.CITY_SERVICE_LIST)!;
        //Transform string to json
        var data = json.decode(value);
        //Stop processing if theres no data
        if (data == null) return [];
        //Read json and transform in city list
        data.forEach((key, value) {
          cityServicesInformation![key as String] =
              ServiceModel.listFromJson(value);
        });
      }
      //Filter city list to find respective city
      return cityServicesInformation!.entries
          .where((element) => element.key.contains(searchString))
          .map((e) => SearchResultModel(services: e, type: "CITY"))
          .toList();
    } catch (e) {
      print("[MapsLocalDataSourceImpl] ${e.toString()}");
      throw ServerException();
    }
  }

  @override
  Future<Position> getUserLocation() async {
    try {
      //Get user geopoint
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best,
          forceAndroidLocationManager: true);
      return position;
    } catch (e) {
      print("[MapsLocalDataSourceImpl] ${e.toString()}");
      throw ServerException();
    }
  }
}
