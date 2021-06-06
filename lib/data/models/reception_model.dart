import 'package:saude_mental_sus/data/entities/reception.dart';

class ReceptionModel extends Reception {
  ReceptionModel({required weekDay, required openingHour, required closingHour})
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

  static List<ReceptionModel> listFromJson(List<dynamic> json) {
    return json.map((value) => ReceptionModel.fromJson(value)).toList();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['weekDay'] = weekDay;
    json['openingHour'] = openingHour;
    json['closingHour'] = closingHour;

    return json;
  }

  static List<dynamic> listToJson(List<ReceptionModel> receptionModels) {
    return receptionModels.map((ReceptionModel receptionModel) {
      return receptionModel.toJson();
    }).toList();
  }
}
