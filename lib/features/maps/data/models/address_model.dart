import 'package:saudeMentalSus/features/maps/domain/entities/address.dart';
import 'package:meta/meta.dart';

class AddressModel extends Address {
  AddressModel(
      {@required street,
      @required district,
      @required houseNumber,
      @required latitude,
      @required longitude})
      : super(
            street: street,
            district: district,
            houseNumber: houseNumber,
            latitude: latitude,
            longitude: longitude);

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return AddressModel(
        street: json['street'],
        district: json['district'],
        houseNumber: json['houseNumber'],
        latitude: json['lat'],
        longitude: json['long']);
  }
}
