import 'package:equatable/equatable.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/region.dart';
import 'package:meta/meta.dart';

class City extends Equatable {
  final String name;
  final List<Region> regions;
  final String federationUnity;

  City(
      {@required this.name,
      @required this.regions,
      @required this.federationUnity});

  @override
  List<Object> get props => [name, regions, federationUnity];
}
