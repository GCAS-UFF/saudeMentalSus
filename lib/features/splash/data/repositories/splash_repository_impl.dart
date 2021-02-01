import 'package:dartz/dartz.dart';
import 'package:saudeMentalSus/core/error/exception.dart';
import 'package:saudeMentalSus/core/error/failure.dart';
import 'package:saudeMentalSus/features/splash/data/datasources/splash_local_data_source.dart';
import 'package:saudeMentalSus/features/splash/domain/repositories/splash_repository.dart';
import 'package:meta/meta.dart';

class SplashRepositoryImpl extends SplashRepository {
  final SplashLocalDataSource localDataSource;

  SplashRepositoryImpl({
    @required this.localDataSource,
  });

  @override
  Future<Either<Failure, bool>> loadCityServices() async {
    try {
      return Right(await localDataSource.loadCityServices());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
