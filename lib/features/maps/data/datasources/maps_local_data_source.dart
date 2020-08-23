import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:saudeMentalSus/core/error/exception.dart';
import 'package:saudeMentalSus/features/maps/data/models/city_model.dart';
import 'package:saudeMentalSus/features/maps/data/models/region_model.dart';
import 'package:saudeMentalSus/features/maps/data/models/service_model.dart';

abstract class MapsLocalDataSource {
  Future<List<ServiceModel>> getServicesListFromJson(String searchString);
  Future<String> getUserLocation();
}

class MapsLocalDataSourceImpl extends MapsLocalDataSource {
  final Geolocator geolocator;
  List<ServiceModel> _serviesList;
  List<CityModel> _cities;

  MapsLocalDataSourceImpl({this.geolocator});

  @override
  Future<List<ServiceModel>> getServicesListFromJson(
      String searchString) async {
    try {
      // Initialize service list
      if (_serviesList == null) {
        //Get json from assets as string
        String value = await rootBundle.loadString('assets/services.json');
        //Transform string to json
        var data = json.decode(value);
        //Stop processing if theres no data
        if (data == null) return null;
        //Read json and transform in services list
        _serviesList = List.generate(
            data.length, (index) => ServiceModel.fromJson(data[index]));
      }

      if (_cities == null) {
        //Get json from assets as string
        String value = await rootBundle.loadString('assets/database.json');
        //Transform string to json
        var data = json.decode(value);
        //Stop processing if theres no data
        if (data == null) return null;
        //Read json and transform in city list
        _cities = List.generate(
            data.length, (index) => CityModel.fromJson(data[index]));

        for (CityModel city in _cities) {
          for (RegionModel region in city.regions) {
            List<ServiceModel> currentServicesList = region.servicesList;
            for (int i = 0; i < currentServicesList.length; i++) {
              currentServicesList[i] = _serviesList[i];
            }
          }
        }
      }

      //Filter city list to find respective city
      return _cities.firstWhere((element) => element.name == currentCity);
    } catch (e) {
      print("[MapsLocalDataSourceImpl] ${e.toString()}");
      throw ServerException();
    }
  }

  @override
  Future<String> getUserLocation() async {
    try {
      //Get user geopoint
      Position position = await geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      //Transform into placemarks
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          position.latitude, position.longitude);
      //Get first place mark
      Placemark place = p[0];
      //Get city from place mark
      return place.subAdministrativeArea;
    } catch (e) {
      print("[MapsLocalDataSourceImpl] ${e.toString()}");
      throw ServerException();
    }
  }
}
