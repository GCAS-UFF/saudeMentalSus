import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/service.dart';

class SearchResult extends Equatable {
  final MapEntry<String, List<Service>> services;
  final String type;

  SearchResult({@required this.services, @required this.type});

  @override
  List<Object> get props => [services, type];
}
