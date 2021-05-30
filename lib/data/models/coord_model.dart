import 'package:sabegra_saude_mental/core/util/converter.dart';
import 'package:sabegra_saude_mental/data/entities/coord.dart';

class CoordModel extends Coord {
  CoordModel({required name, required type, required phones, required emails})
      : super(name: name, coordType: type, phones: phones, emails: emails);

  factory CoordModel.fromJson(Map<String, dynamic> json) {
    return CoordModel(
      name: json['name'],
      type: Converter.convertStringToEnum<CoordType>(
          json['type'], CoordType.values),
      phones: Converter.convertListDynamicToListString(json['phone']),
      emails: Converter.convertListDynamicToListString(json['email']),
    );
  }

  static List<CoordModel> listFromJson(List<dynamic> json) {
    return json.map((value) => CoordModel.fromJson(value)).toList();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['name'] = name;

    json['type'] = Converter.convertEnumToString(coordType);
    json['phone'] = phones;
    json['email'] = emails;

    return json;
  }

  static List<dynamic> listToJson(List<CoordModel> coordModels) {
    return coordModels.map((CoordModel coordModel) {
      return coordModel.toJson();
    }).toList();
  }
}
