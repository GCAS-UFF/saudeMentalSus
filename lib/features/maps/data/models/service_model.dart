import 'package:saudeMentalSus/core/util/converter.dart';
import 'package:saudeMentalSus/features/maps/data/models/address_model.dart';
import 'package:saudeMentalSus/features/maps/data/models/reception_model.dart';
import 'package:saudeMentalSus/features/maps/data/models/region_model.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/service.dart';
import 'package:meta/meta.dart';

import 'coord_model.dart';

class ServiceModel extends Service {
  ServiceModel(
      {@required region,
      @required coord,
      @required reception,
      @required name,
      @required phones,
      @required emails,
      @required type,
      @required address})
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
    if (json == null) return null;
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
    return json == null
        ? List<ServiceModel>()
        : json.map((value) => ServiceModel.fromJson(value)).toList();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (name != null) json['name'] = name;
    if (institutionType != null)
      json['type'] = Converter.convertEnumToString(institutionType);
    if (regions != null) json['region'] = (RegionModel.listToJson(regions));
    if (coords != null) json['coord'] = CoordModel.listToJson(coords);
    if (receptions != null)
      json['reception'] = ReceptionModel.listToJson(receptions);
    if (phones != null) json['phone'] = phones;
    if (emails != null) json['email'] = emails;
    if (address != null)
      json['address'] = AddressModel.fromEntity(address).toJson();

    return json;
  }

  static List<dynamic> listToJson(List<ServiceModel> serviceModels) {
    if (serviceModels == null) return null;
    return serviceModels.map((ServiceModel serviceModel) {
      return serviceModel.toJson();
    }).toList();
  }
}
