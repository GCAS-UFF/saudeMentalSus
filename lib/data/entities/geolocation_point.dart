import 'package:equatable/equatable.dart';

class GeolocationPoint extends Equatable {
  final double latitude;
  final double longitude;

  GeolocationPoint({required this.latitude, required this.longitude});

  @override
  List<Object> get props => [latitude, longitude];
}
