import 'package:equatable/equatable.dart';
import 'address.dart';
import 'coord.dart';
import 'reception.dart';
import 'region.dart';

class Service extends Equatable {
  final List<Coord> coords;
  final List<Reception> receptions;
  final List<Region> regions;
  final String name;
  final List<String> phones;
  final List<String> emails;
  final Address address;
  final InstitutionType institutionType;

  Service(
      {required this.coords,
      required this.receptions,
      required this.regions,
      required this.name,
      required this.phones,
      required this.emails,
      required this.address,
      required this.institutionType});

  @override
  List<Object> get props => [
        coords,
        receptions,
        regions,
        name,
        phones,
        emails,
        address,
        institutionType
      ];
}

enum InstitutionType {
  AMB,
  CT,
  CAPS,
}
