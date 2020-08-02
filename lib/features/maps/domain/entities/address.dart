import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/geolocation_point.dart';

class Address extends Equatable {
  final String street;
  final String district;
  final String houseNumber;
  final GeolocationPoint geolocationPoint;

  Address(
      {@required this.street,
      @required this.district,
      @required this.houseNumber,
      @required this.geolocationPoint});

  @override
  List<Object> get props => [street, district, houseNumber, geolocationPoint];

  @override
  String toString() => "$street, $houseNumber, $district";
}
