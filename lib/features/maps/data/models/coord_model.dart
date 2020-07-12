import 'package:saudeMentalSus/core/util/converter.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/coord.dart';
import 'package:meta/meta.dart';

class CoordModel extends Coord {
  CoordModel({@required name, @required phones, @required emails})
      : super(name: name, phones: phones, emails: emails);

  factory CoordModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return CoordModel(
      name: json['name'],
      phones: Converter.convertListDynamicToListString(json['phone']),
      emails: Converter.convertListDynamicToListString(json['email']),
    );
  }

  static List<CoordModel> listFromJson(List<dynamic> json) {
    return json == null
        ? List<CoordModel>()
        : json.map((value) => CoordModel.fromJson(value)).toList();
  }
}
