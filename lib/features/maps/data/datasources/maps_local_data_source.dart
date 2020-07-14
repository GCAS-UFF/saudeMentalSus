import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:saudeMentalSus/core/error/exception.dart';
import 'package:saudeMentalSus/features/maps/data/models/city_model.dart';
import 'package:saudeMentalSus/features/maps/data/models/geolocation_point_model.dart';

abstract class MapsLocalDataSource {
  Future<List<CityModel>> getCouponsListFromJson();
  Future<GeolocationPointModel> getUserLocation();
}

class MapsLocalDataSourceImpl extends MapsLocalDataSource {
  final Geolocator geolocator;

  MapsLocalDataSourceImpl({this.geolocator});

  @override
  Future<List<CityModel>> getCouponsListFromJson() async {
    try {
      String value = await rootBundle.loadString('assets/database.json');
      var data = json.decode(value);
      if (data == null) return null;
      return List.generate(
          data.length, (index) => CityModel.fromJson(data[index]));
    } catch (e) {
      print("[MapsLocalDataSourceImpl] ${e.toString()}");
      throw ServerException();
    }
  }

  @override
  Future<GeolocationPointModel> getUserLocation() async {
    try {
      Position position = await geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      return GeolocationPointModel.fromPosition(position);
    } catch (e) {
      print("[MapsLocalDataSourceImpl] ${e.toString()}");
      throw ServerException();
    }
  }
}
