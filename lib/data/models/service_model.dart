import 'package:saudeMentalSus/core/util/converter.dart';
import 'address_model.dart';
import 'reception_model.dart';
import 'region_model.dart';
import 'package:saudeMentalSus/data/entities/service.dart';

import 'coord_model.dart';

class ServiceModel extends Service {
  ServiceModel(
      {required region,
      required coord,
      required reception,
      required name,
      required phones,
      required emails,
      required type,
      required address})
      : super(
            regions: region,
            coords: coord,
            receptions: reception,
            name: name,
            phones: phones,
            emails: emails,
            institutionType: type,
            address: address);

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      region: RegionModel.listFromJson(json['region']),
      coord: CoordModel.listFromJson(json['coord']),
      reception: ReceptionModel.listFromJson(json['reception']),
      name: json['name'],
      phones: Converter.convertListDynamicToListString(json['phone']),
      emails: Converter.convertListDynamicToListString(json['email']),
      type: Converter.convertStringToEnum<InstitutionType>(
          json['type'], InstitutionType.values),
      address: AddressModel.fromJson(json['address']),
    );
  }

  static List<ServiceModel> listFromJson(List<dynamic> json) {
    return json.map((value) => ServiceModel.fromJson(value)).toList();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['name'] = name;
    json['type'] = Converter.convertEnumToString(institutionType);
    json['region'] = (RegionModel.listToJson(regions.cast()));
    json['coord'] = CoordModel.listToJson(coords.cast());
    json['reception'] = ReceptionModel.listToJson(receptions.cast());
    json['phone'] = phones;
    json['email'] = emails;
    json['address'] = AddressModel.fromEntity(address).toJson();

    return json;
  }

  static List<dynamic> listToJson(List<ServiceModel> serviceModels) {
    return serviceModels.map((ServiceModel serviceModel) {
      return serviceModel.toJson();
    }).toList();
  }
}
