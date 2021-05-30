import 'package:geolocator/geolocator.dart';
import 'package:sabegra_saude_mental/data/entities/geolocation_point.dart';

class GeolocationPointModel extends GeolocationPoint {
  GeolocationPointModel({required latitude, required longitude})
      : super(latitude: latitude, longitude: longitude);

  factory GeolocationPointModel.fromJson(Map<String, dynamic> json) {
    return GeolocationPointModel(
        latitude: json['lat'], longitude: json['long']);
  }

  factory GeolocationPointModel.fromPosition(Position position) {
    return GeolocationPointModel(
        latitude: position.latitude, longitude: position.longitude);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['lat'] = latitude;
    json['long'] = longitude;

    return json;
  }

  factory GeolocationPointModel.fromEntity(GeolocationPoint geolocationPoint) {
    return GeolocationPointModel(
        latitude: geolocationPoint.latitude,
        longitude: geolocationPoint.longitude);
  }

  static List<GeolocationPointModel> listFromJson(List<dynamic> json) {
    return json.map((value) => GeolocationPointModel.fromJson(value)).toList();
  }
}
