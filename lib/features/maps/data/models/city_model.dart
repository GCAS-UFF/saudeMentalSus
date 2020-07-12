import 'package:saudeMentalSus/features/maps/domain/entities/city.dart';
import 'package:meta/meta.dart';

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
      servicesList: json['servicesList'],
      federationUnity: json['federationUnity'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (name != null) data['name'] = this.name;
    if (servicesList != null) data['servicesList'] = this.servicesList;
    if (federationUnity != null) data['federationUnity'] = this.federationUnity;
    return data;
  }
}
