import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:saudeMentalSus/features/maps/data/models/city_model.dart';

abstract class MapsLocalDataSource {
  Future<List<CityModel>> getCouponsListFromJson();
}

class MapsLocalDataSourceImpl extends MapsLocalDataSource {
  @override
  Future<List<CityModel>> getCouponsListFromJson() async {
    try {
      String value = await rootBundle.loadString('assets/database.json');
      var data = json.decode(value);
      if (data == null) return null;
      return List.generate(
          data.length, (index) => CityModel.fromJson(data[index]));
    } catch (e) {
      print(e.toString());
      return null;
    } finally {
      print("Carregado com sucesso");
    }
  }
}
