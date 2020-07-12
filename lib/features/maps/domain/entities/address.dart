import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Address extends Equatable {
  final String street;
  final String district;
  final String houseNumber;
  final double latitude;
  final double longitude;

  Address(
      {@required this.street,
      @required this.district,
      @required this.houseNumber,
      @required this.latitude,
      @required this.longitude});

  @override
  List<Object> get props =>
      [street, district, houseNumber, latitude, longitude];
}
