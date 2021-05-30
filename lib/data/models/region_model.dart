import 'package:sabegra_saude_mental/data/entities/region.dart';

class RegionModel extends Region {
  RegionModel({required name}) : super(name: name);

  factory RegionModel.fromJson(Map<String, dynamic> json) {
    return RegionModel(name: json['name']);
  }

  static List<RegionModel> listFromJson(List<dynamic> json) {
    return json.map((value) => RegionModel.fromJson(value)).toList();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['name'] = name;

    return json;
  }

  static List<dynamic> listToJson(List<RegionModel> regionModels) {
    return regionModels.map((RegionModel regionModel) {
      return regionModel.toJson();
    }).toList();
  }
}
