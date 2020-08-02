import 'package:geolocator/geolocator.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/geolocation_point.dart';
import 'package:meta/meta.dart';

class GeolocationPointModel extends GeolocationPoint {
  GeolocationPointModel({@required latitude, @required longitude})
      : super(latitude: latitude, longitude: longitude);

  factory GeolocationPointModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return GeolocationPointModel(
        latitude: json['lat'], longitude: json['long']);
  }

  factory GeolocationPointModel.fromPosition(Position position) {
    if (position == null) return null;
    return GeolocationPointModel(
        latitude: position.latitude, longitude: position.longitude);
  }

  static List<GeolocationPointModel> listFromJson(List<dynamic> json) {
    return json == null
        ? List<GeolocationPointModel>()
        : json.map((value) => GeolocationPointModel.fromJson(value)).toList();
  }
}
