import 'package:saudeMentalSus/features/maps/domain/entities/city.dart';
import 'package:meta/meta.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/service.dart';

class CityModel extends City {
  CityModel(
      {@required name, @required servicesList, @required federationUnity})
      : super(
            name: name,
            servicesList: servicesList,
            federationUnity: federationUnity);

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      name: json['name'],
      servicesList: Service.listFromJson(json['servicesList']),
      federationUnity: json['federationUnity'],
    );
  }
}
