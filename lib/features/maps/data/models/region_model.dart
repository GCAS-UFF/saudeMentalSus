import 'package:saudeMentalSus/features/maps/domain/entities/region.dart';

import 'package:meta/meta.dart';

class RegionModel extends Region {
  RegionModel({@required name}) : super(name: name);

  factory RegionModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return RegionModel(name: json['name']);
  }

  static List<RegionModel> listFromJson(List<dynamic> json) {
    return json == null
        ? List<RegionModel>()
        : json.map((value) => RegionModel.fromJson(value)).toList();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (name != null) json['name'] = name;

    return json;
  }

  static List<dynamic> listToJson(List<RegionModel> regionModels) {
    if (regionModels == null) return null;
    return regionModels.map((RegionModel regionModel) {
      return regionModel.toJson();
    }).toList();
  }
}
