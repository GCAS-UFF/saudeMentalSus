import 'package:equatable/equatable.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/coord.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/institution.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/reception.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/region.dart';
import 'package:meta/meta.dart';

class Service extends Equatable {
  final Institution institution;
  final List<Coord> coords;
  final List<Reception> receptions;
  final List<Region> regions;

  Service(
      {@required this.institution,
      @required this.coords,
      @required this.receptions,
      @required this.regions});

  @override
  List<Object> get props => [institution, coords, receptions, regions];
}
