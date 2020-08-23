import 'package:saudeMentalSus/features/maps/data/models/region_model.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/city.dart';
import 'package:meta/meta.dart';

class CityModel extends City {
  CityModel({@required name, @required regions, @required federationUnity})
      : super(name: name, regions: regions, federationUnity: federationUnity);

  factory CityModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return CityModel(
      name: json['name'],
      regions: RegionModel.listFromJson(json['regions']),
      federationUnity: json['federationUnity'],
    );
  }
}
