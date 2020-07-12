import 'package:saudeMentalSus/features/maps/domain/entities/reception.dart';
import 'package:meta/meta.dart';

class ReceptionModel extends Reception {
  ReceptionModel(
      {@required weekDay, @required openingHour, @required closingHour})
      : super(
            weekDay: weekDay,
            openingHour: openingHour,
            closingHour: closingHour);

  factory ReceptionModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return ReceptionModel(
      weekDay: json['weekDay'],
      openingHour: json['openingHour'],
      closingHour: json['closingHour'],
    );
  }

  static List<ReceptionModel> listFromJson(List<dynamic> json) {
    return json == null
        ? List<ReceptionModel>()
        : json.map((value) => ReceptionModel.fromJson(value)).toList();
  }
}
