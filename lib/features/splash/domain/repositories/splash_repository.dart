import 'package:dartz/dartz.dart';
import 'package:saudeMentalSus/core/error/failure.dart';

abstract class SplashRepository {
  Future<Either<Failure, bool>> loadCityServices();
}
