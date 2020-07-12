import 'package:saudeMentalSus/core/util/converter.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/institution.dart';
import 'package:meta/meta.dart';

import 'address_model.dart';

class InstitutionModel extends Institution {
  InstitutionModel(
      {@required name,
      @required phones,
      @required emails,
      @required type,
      @required address})
      : super(
            name: name,
            phones: phones,
            emails: emails,
            institutionType: type,
            address: address);

  factory InstitutionModel.fromJson(Map<String, dynamic> json) {
    return InstitutionModel(
        name: json['name'],
        phones: Converter.convertListDynamicToListString(json['phone']),
        emails: Converter.convertListDynamicToListString(json['email']),
        type: json['type'],
        address: json['address'] != null
            ? new AddressModel.fromJson(json['address'])
            : null);
  }
}
