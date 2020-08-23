import 'package:equatable/equatable.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/coord.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/institution.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/reception.dart';
import 'package:meta/meta.dart';

class Service extends Equatable {
  final dynamic id;
  final Institution institution;
  final List<Coord> coords;
  final List<Reception> receptions;

  Service({
    @required this.id,
    @required this.institution,
    @required this.coords,
    @required this.receptions,
  });

  @override
  List<Object> get props => [id, institution, coords, receptions];
}
