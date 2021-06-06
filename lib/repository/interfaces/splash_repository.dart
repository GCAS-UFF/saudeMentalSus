import 'package:dartz/dartz.dart';
import 'package:saude_mental_sus/core/error/failure.dart';

abstract class SplashRepository {
  Future<Either<Failure, bool>> loadCityServices();
}
