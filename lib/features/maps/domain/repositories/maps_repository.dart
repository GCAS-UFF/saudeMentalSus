import 'package:dartz/dartz.dart';
import 'package:saudeMentalSus/core/error/failure.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/city.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/geolocation_point.dart';

abstract class MapsRepository {
  Future<Either<Failure, City>> getCityServices(
      GeolocationPoint geolocationPoint);
}
