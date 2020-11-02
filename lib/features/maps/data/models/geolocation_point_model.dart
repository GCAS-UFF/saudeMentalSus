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

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (latitude != null) json['lat'] = latitude;
    if (longitude != null) json['long'] = longitude;

    return json;
  }

  factory GeolocationPointModel.fromEntity(GeolocationPoint geolocationPoint) {
    if (geolocationPoint == null) return null;
    return GeolocationPointModel(
        latitude: geolocationPoint.latitude,
        longitude: geolocationPoint.longitude);
  }

  static List<GeolocationPointModel> listFromJson(List<dynamic> json) {
    return json == null
        ? List<GeolocationPointModel>()
        : json.map((value) => GeolocationPointModel.fromJson(value)).toList();
  }
}
