import 'package:saudeMentalSus/features/maps/data/models/institution_model.dart';
import 'package:saudeMentalSus/features/maps/data/models/reception_model.dart';
import 'package:saudeMentalSus/features/maps/data/models/region_model.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/service.dart';
import 'package:meta/meta.dart';

import 'coord_model.dart';

class ServiceModel extends Service {
  ServiceModel({@required id, institution, coord, reception})
      : super(
            id: id,
            institution: institution,
            coords: coord,
            receptions: reception);

  factory ServiceModel.fromJson(dynamic json) {
    if (json == null) return null;
    if (json is Map) {
      return ServiceModel(
        id: json['id'],
        institution: InstitutionModel.fromJson(json['institution']),
        coord: CoordModel.listFromJson(json['coord']),
        reception: ReceptionModel.listFromJson(json['reception']),
      );
    } else {
      return ServiceModel(id: json);
    }
  }

  static List<ServiceModel> listFromJson(List<dynamic> json) {
    return json == null
        ? List<ServiceModel>()
        : json.map((value) => ServiceModel.fromJson(value)).toList();
  }
}
