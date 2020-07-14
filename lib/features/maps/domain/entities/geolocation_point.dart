import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class GeolocationPoint extends Equatable {
  final double latitude;
  final double longitude;

  GeolocationPoint({@required this.latitude, @required this.longitude});

  @override
  List<Object> get props => [latitude, longitude];
}
