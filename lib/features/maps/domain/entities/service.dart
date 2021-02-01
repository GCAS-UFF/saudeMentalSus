import 'package:equatable/equatable.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/address.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/coord.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/reception.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/region.dart';
import 'package:meta/meta.dart';

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
      {@required this.coords,
      @required this.receptions,
      @required this.regions,
      @required this.name,
      @required this.phones,
      @required this.emails,
      @required this.address,
      @required this.institutionType});

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
