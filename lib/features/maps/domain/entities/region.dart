import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/service.dart';

class Region extends Equatable {
  final String name;
  final List<Service> servicesList;

  Region({@required this.name, @required this.servicesList});

  @override
  List<Object> get props => [name, servicesList];
}
