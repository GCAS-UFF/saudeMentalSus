import 'package:dartz/dartz.dart';
import 'package:saudeMentalSus/core/error/failure.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/city.dart';

abstract class MapsRepository {
  Future<Either<Failure, City>> getCityServices(
      double latitude, double longitude);
}
