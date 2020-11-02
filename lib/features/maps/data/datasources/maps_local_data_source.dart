import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:saudeMentalSus/core/error/exception.dart';
import 'package:saudeMentalSus/features/maps/data/models/city_model.dart';

abstract class MapsLocalDataSource {
  Future<CityModel> getCityDataFromJson(String currentCity);
  Future<String> getUserLocation();
}

class MapsLocalDataSourceImpl extends MapsLocalDataSource {
  final Geolocator geolocator;

  MapsLocalDataSourceImpl({this.geolocator});

  @override
  Future<CityModel> getCityDataFromJson(String currentCity) async {
    try {
      //Get json from assets as string
      String value = await rootBundle.loadString('assets/rj_niteroi.json');
      //Transform string to json
      var data = json.decode(value);
      //Stop processing if theres no data
      if (data == null) return null;
      //Read json and transform in city list
      List<CityModel> cities = List.generate(
          data.length, (index) => CityModel.fromJson(data[index]));
      //Filter city list to find respective city
      return cities.firstWhere((element) => element.name == currentCity);
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
