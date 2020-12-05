import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:saudeMentalSus/core/error/exception.dart';
import 'package:saudeMentalSus/core/resources/keys.dart';
import 'package:saudeMentalSus/features/maps/data/models/search_result_model.dart';
import 'package:saudeMentalSus/features/maps/data/models/service_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

abstract class MapsLocalDataSource {
  Future<List<SearchResultModel>> searchServices(String searchString);
  Future<String> getUserLocation();
}

class MapsLocalDataSourceImpl extends MapsLocalDataSource {
  final Geolocator geolocator;
  final SharedPreferences sharedPreferences;
  Map<String, List<ServiceModel>> cityServicesInformation;

  MapsLocalDataSourceImpl(
      {@required this.geolocator, @required this.sharedPreferences});

  @override
  Future<List<SearchResultModel>> searchServices(String searchString) async {
    try {
      if (cityServicesInformation == null) {
        //Get json from sharedPreferences
        String value = sharedPreferences.getString(Keys.CITY_SERVICE_LIST);
        //Transform string to json
        var data = json.decode(value);
        //Stop processing if theres no data
        if (data == null) return null;
        //Read json and transform in city list
        data.forEach((key, value) {
          cityServicesInformation[key as String] =
              ServiceModel.listFromJson(value);
        });
      }
      //Filter city list to find respective city
      return cityServicesInformation.entries
          .where((element) => element.key.contains(searchString))
          .map((e) => SearchResultModel(services: e, type: "CITY"))
          .toList();
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
