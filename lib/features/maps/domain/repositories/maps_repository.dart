import 'package:dartz/dartz.dart';
import 'package:saudeMentalSus/core/error/failure.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/service.dart';

abstract class MapsRepository {
  Future<Either<Failure, List<Service>>> getCityServices(String searchString);
}
