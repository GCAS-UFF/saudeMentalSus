import 'package:saudeMentalSus/features/maps/data/models/service_model.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/city.dart';
import 'package:meta/meta.dart';

class CityModel extends City {
  CityModel({@required name, @required servicesList, @required federationUnity})
      : super(
            name: name,
            servicesList: servicesList,
            federationUnity: federationUnity);

  factory CityModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return CityModel(
      name: json['name'],
      servicesList: ServiceModel.listFromJson(json['servicesList']),
      federationUnity: json['federationUnity'],
    );
  }
}
