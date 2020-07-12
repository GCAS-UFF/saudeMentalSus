import 'package:equatable/equatable.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/address.dart';
import 'package:meta/meta.dart';

class Institution extends Equatable {
  final String name;
  final List<String> phones;
  final List<String> emails;
  final Address address;
  final InstitutionType institutionType;

  Institution(
      {@required this.name,
      @required this.phones,
      @required this.emails,
      @required this.address,
      @required this.institutionType});

  @override
  List<Object> get props => [name, phones, emails, address, institutionType];
}

enum InstitutionType {
  AMB,
  CT,
  CAPS,
}
