import 'package:saudeMentalSus/core/error/exception.dart';
import 'package:saudeMentalSus/features/maps/data/datasources/maps_local_data_source.dart';
import 'package:saudeMentalSus/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/search_result.dart';
import 'package:saudeMentalSus/features/maps/domain/repositories/maps_repository.dart';
import 'package:meta/meta.dart';

class MapsRepositoryImpl extends MapsRepository {
  final MapsLocalDataSource localDataSource;

  MapsRepositoryImpl({@required this.localDataSource});

  @override
  Future<Either<Failure, List<SearchResult>>> searchServices(
      String searchString) async {
    try {
      String currentSearchString = searchString;

      if (currentSearchString == null) {
        currentSearchString = await localDataSource.getUserLocation();
      }

      print(currentSearchString);

      return Right(await localDataSource.searchServices(searchString));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
