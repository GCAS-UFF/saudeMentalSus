import 'service_model.dart';
import 'package:saude_mental_sus/data/entities/city.dart';

class CityModel extends City {
  CityModel({required name, required servicesList, required federationUnity})
      : super(
            name: name,
            servicesList: servicesList,
            federationUnity: federationUnity);

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      name: json['name'],
      servicesList: ServiceModel.listFromJson(json['servicesList']),
      federationUnity: json['federationUnity'],
    );
  }
}
