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
    return ReceptionModel(
      weekDay: json['weekDay'],
      openingHour: json['openingHour'],
      closingHour: json['closingHour'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (weekDay != null) data['weekDay'] = this.weekDay;
    if (weekDay != null) data['openingHour'] = this.openingHour;
    if (weekDay != null) data['closingHour'] = this.closingHour;
    return data;
  }
}
