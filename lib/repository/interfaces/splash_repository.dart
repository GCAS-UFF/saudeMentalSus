import 'package:dartz/dartz.dart';
import 'package:sabegra_saude_mental/core/error/failure.dart';

abstract class SplashRepository {
  Future<Either<Failure, bool>> loadCityServices();
}
