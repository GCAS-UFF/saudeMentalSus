import 'package:saudeMentalSus/features/maps/domain/entities/coord.dart';
import 'package:meta/meta.dart';

class CoordModel extends Coord {
  CoordModel(
      {@required name, @required phones, @required emails})
      : super(
            name: name,
            phones: phones,
            emails: emails);

  factory CoordModel.fromJson(Map<String, dynamic> json) {
    return CoordModel(
      name: json['name'],
      phones: json['phone'],
      emails: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (name != null) data['name'] = this.name;
    if (phones != null) data['phone'] = this.phones;
    if (emails != null) data['email'] = this.emails;
    return data;
  }
}
