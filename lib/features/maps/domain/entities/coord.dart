import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Coord extends Equatable {
  final String name;
  final CoordType coordType;
  final List<String> phones;
  final List<String> emails;

  Coord(
      {@required this.name,
      @required this.coordType,
      @required this.phones,
      @required this.emails});

  @override
  List<Object> get props => [name, phones, emails, coordType];
}

enum CoordType {
  GERAL,
  TECNICA,
}
