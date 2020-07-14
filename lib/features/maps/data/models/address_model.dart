import 'package:saudeMentalSus/features/maps/data/models/geolocation_point_model.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/address.dart';
import 'package:meta/meta.dart';

class AddressModel extends Address {
  AddressModel(
      {@required street,
      @required district,
      @required houseNumber,
      @required geolocationPoint})
      : super(
            street: street,
            district: district,
            houseNumber: houseNumber,
            geolocationPoint: geolocationPoint);

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return AddressModel(
        street: json['street'],
        district: json['district'],
        houseNumber: json['houseNumber'],
        geolocationPoint: GeolocationPointModel.fromJson(json));
  }
}
