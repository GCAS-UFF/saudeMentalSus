import 'package:saudeMentalSus/features/maps/domain/entities/address.dart';
import 'package:meta/meta.dart';

class AddressModel extends Address {
  AddressModel(
      {@required street, @required district, @required houseNumber, 
      @required latitude, @required longitude})
      : super(
            street: street,
            district: district,
            houseNumber: houseNumber,
            latitude: latitude,
            longitude: longitude);

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      street: json['street'],
      district: json['district'],
      houseNumber: json['houseNumber'],
      latitude: json['lat'],
      longitude: json['long']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (street != null) data['street'] = this.street;
    if (district != null) data['district'] = this.district;
    if (houseNumber != null) data['houseNumber'] = this.houseNumber;
    if (latitude != null) data['lat'] = this.latitude;
    if (longitude != null) data['long'] = this.longitude;
    return data;
  }
}
