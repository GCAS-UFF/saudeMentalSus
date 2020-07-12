import 'package:saudeMentalSus/features/maps/data/models/institution_model.dart';
import 'package:saudeMentalSus/features/maps/data/models/reception_model.dart';
import 'package:saudeMentalSus/features/maps/data/models/region_model.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/service.dart';
import 'package:meta/meta.dart';

import 'coord_model.dart';

class ServiceModel extends Service {
  ServiceModel(
      {@required institution,
      @required region,
      @required coord,
      @required reception})
      : super(
            institution: institution,
            regions: region,
            coords: coord,
            receptions: reception);

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return ServiceModel(
      institution: InstitutionModel.fromJson(json['institution']),
      region: RegionModel.listFromJson(json['region']),
      coord: CoordModel.listFromJson(json['coord']),
      reception: ReceptionModel.listFromJson(json['reception']),
    );
  }

  static List<ServiceModel> listFromJson(List<dynamic> json) {
    return json == null
        ? List<ServiceModel>()
        : json.map((value) => ServiceModel.fromJson(value)).toList();
  }
}
