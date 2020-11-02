import 'package:saudeMentalSus/core/util/converter.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/coord.dart';
import 'package:meta/meta.dart';

class CoordModel extends Coord {
  CoordModel(
      {@required name, @required type, @required phones, @required emails})
      : super(name: name, coordType: type, phones: phones, emails: emails);

  factory CoordModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return CoordModel(
      name: json['name'],
      type: Converter.convertStringToEnum<CoordType>(
          json['type'], CoordType.values),
      phones: Converter.convertListDynamicToListString(json['phone']),
      emails: Converter.convertListDynamicToListString(json['email']),
    );
  }

  static List<CoordModel> listFromJson(List<dynamic> json) {
    return json == null
        ? List<CoordModel>()
        : json.map((value) => CoordModel.fromJson(value)).toList();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (name != null) json['name'] = name;
    if (coordType != null)
      json['type'] = Converter.convertEnumToString(coordType);
    if (phones != null) json['phone'] = phones;
    if (emails != null) json['email'] = emails;

    return json;
  }

  static List<dynamic> listToJson(List<CoordModel> coordModels) {
    if (coordModels == null) return null;
    return coordModels.map((CoordModel coordModel) {
      return coordModel.toJson();
    }).toList();
  }
}
