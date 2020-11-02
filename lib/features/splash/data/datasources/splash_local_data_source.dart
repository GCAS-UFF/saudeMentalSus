import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:saudeMentalSus/core/error/exception.dart';
import 'package:saudeMentalSus/core/resources/arrays.dart';
import 'package:saudeMentalSus/core/resources/keys.dart';
import 'package:saudeMentalSus/features/maps/data/models/city_model.dart';
import 'package:saudeMentalSus/features/maps/data/models/service_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

abstract class SplashLocalDataSource {
  Future<void> loadCityServices();
}

class SplashLocalDataSourceImpl implements SplashLocalDataSource {
  final SharedPreferences sharedPreferences;
  Map<String, List<ServiceModel>> cityServicesInformation;

  SplashLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<void> loadCityServices() async {
    //Initialize map to contains services list based on city
    cityServicesInformation = Map<String, List<ServiceModel>>();

    //Run through all jsons in database
    try {
      for (String jsonName in Arrays.jsonNames) {
        //Get json from assets as string
        String value = await rootBundle.loadString(jsonName);
        //Transform string to json
        var data = json.decode(value);
        //Stop processing if theres no data
        if (data == null) return null;
        //Read json and transform in city list
        CityModel city = CityModel.fromJson(data);
        // Add city to map
        cityServicesInformation["${city.name} - ${city.federationUnity}"] =
            city.servicesList;
      }
      // Trnasform result in json and save in string format
      sharedPreferences.setString(
          Keys.CITY_SERVICE_LIST, _saveIntoLocalStorage());
    } catch (e) {
      print("[SplashLocalDataSourceImpl] ${e.toString()}");
      throw ServerException();
    }
  }

  String _saveIntoLocalStorage() {
    //Create map to store result
    Map<String, List<dynamic>> dataToSave = Map<String, List<dynamic>>();
    ////Run through cityServicesInformation transforming in json map
    cityServicesInformation.forEach((String key, List<ServiceModel> value) {
      dataToSave[key] = ServiceModel.listToJson(value);
    });
    //Transform json map into string
    return json.encode(dataToSave);
  }
}
