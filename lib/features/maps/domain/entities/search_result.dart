import 'package:equatable/equatable.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/service.dart';
import 'package:meta/meta.dart';

class SearchResult extends Equatable {
  final List<MapEntry<String, List<Service>>> services;
  final String type;

  SearchResult({@required this.services, @required this.type});

  @override
  List<Object> get props => [services, type];
}
