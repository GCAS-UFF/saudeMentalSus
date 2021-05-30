import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:sabegra_saude_mental/core/error/exception.dart';
import 'package:sabegra_saude_mental/core/resources/keys.dart';
import 'package:sabegra_saude_mental/data/models/city_model.dart';
import 'package:sabegra_saude_mental/data/models/service_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../interfaces/splash_local_data_source.dart';

class SplashLocalDataSourceImpl implements SplashLocalDataSource {
  final SharedPreferences sharedPreferences;
  Map<String, List<ServiceModel>>? cityServicesInformation;

  SplashLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> loadCityServices() async {
    //Initialize map to contains services list based on city
    cityServicesInformation = Map<String, List<ServiceModel>>();
    String jsonName = 'assets/database.json';
    //Run through all jsons in database
    try {
      //Get json from assets as string
      String value = await rootBundle.loadString(jsonName);
      //Transform string to json
      List data = json.decode(value);
      //Stop processing if theres no data
      if (data.isEmpty) return false;
      for (Map<String, dynamic> d in data) {
        //Read json and transform in city list
        CityModel city = CityModel.fromJson(d);
        // Add city to map
        cityServicesInformation!["${city.name} - ${city.federationUnity}"] =
            city.servicesList.cast();
      }

      // Transform result in json and save in string format
      sharedPreferences.setString(
          Keys.CITY_SERVICE_LIST, _saveIntoLocalStorage());

      return true;
    } catch (e) {
      print("[SplashLocalDataSourceImpl] ${e.toString()}");
      throw ServerException();
    }
  }

  String _saveIntoLocalStorage() {
    //Create map to store result
    Map<String, List<dynamic>> dataToSave = Map<String, List<dynamic>>();
    ////Run through cityServicesInformation transforming in json map
    cityServicesInformation!.forEach((String key, List<ServiceModel> value) {
      dataToSave[key] = ServiceModel.listToJson(value);
    });
    //Transform json map into string
    return json.encode(dataToSave);
  }
}
