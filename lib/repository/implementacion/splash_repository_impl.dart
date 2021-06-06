import 'package:dartz/dartz.dart';
import 'package:saude_mental_sus/core/error/exception.dart';
import 'package:saude_mental_sus/core/error/failure.dart';
import 'package:saude_mental_sus/datasources/interfaces/splash_local_data_source.dart';
import 'package:saude_mental_sus/repository/interfaces/splash_repository.dart';

class SplashRepositoryImpl extends SplashRepository {
  final SplashLocalDataSource localDataSource;

  SplashRepositoryImpl({
    required this.localDataSource,
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
