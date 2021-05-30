import 'geolocation_point_model.dart';
import 'package:sabegra_saude_mental/data/entities/address.dart';

class AddressModel extends Address {
  AddressModel(
      {required street,
      required district,
      required houseNumber,
      required geolocationPoint})
      : super(
            street: street,
            district: district,
            houseNumber: houseNumber,
            geolocationPoint: geolocationPoint);

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
        street: json['street'],
        district: json['district'],
        houseNumber: json['houseNumber'],
        geolocationPoint: GeolocationPointModel.fromJson(json));
  }

  factory AddressModel.fromEntity(Address address) {
    return AddressModel(
        street: address.street,
        district: address.district,
        houseNumber: address.houseNumber,
        geolocationPoint: address.geolocationPoint);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['street'] = street;
    json['district'] = district;
    json['houseNumber'] = houseNumber;
    json.addAll(GeolocationPointModel.fromEntity(geolocationPoint).toJson());

    return json;
  }
}
