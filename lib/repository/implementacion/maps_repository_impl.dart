import 'package:geolocator/geolocator.dart';
import 'package:saudeMentalSus/core/error/exception.dart';
import 'package:saudeMentalSus/core/error/failure.dart';
import 'package:saudeMentalSus/data/entities/search_result.dart';
import 'package:saudeMentalSus/datasources/interfaces/maps_local_data_source.dart';

import 'package:dartz/dartz.dart';
import 'package:saudeMentalSus/repository/interfaces/maps_repository.dart';

class MapsRepositoryImpl extends MapsRepository {
  final MapsLocalDataSource localDataSource;

  MapsRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<SearchResult>>> searchServices(
      String searchString) async {
    try {
      String currentSearchString = searchString;

      // if (currentSearchString == null) {
      //   currentSearchString = await localDataSource.getUserLocation();
      // }

      print(currentSearchString);

      return Right(await localDataSource.searchServices(searchString));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Position>> getCurrentPosition() async {
    try {
      Position position = await localDataSource.getUserLocation();
      print(position);
      return Right(position);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
