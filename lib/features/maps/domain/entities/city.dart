import 'package:equatable/equatable.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/services.dart';
import 'package:meta/meta.dart';

class City extends Equatable {
  final String name;
  final List<Service> servicesList;
  final String federationUnity;

  City(
      {@required this.name,
      @required this.servicesList,
      @required this.federationUnity});

  @override
  List<Object> get props => [name, servicesList, federationUnity];
}
