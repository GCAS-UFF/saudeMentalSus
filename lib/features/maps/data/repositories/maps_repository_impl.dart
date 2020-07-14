import 'package:saudeMentalSus/core/error/exception.dart';
import 'package:saudeMentalSus/core/platform/network_info.dart';
import 'package:saudeMentalSus/features/maps/data/datasources/maps_local_data_source.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/geolocation_point.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/city.dart';
import 'package:saudeMentalSus/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:saudeMentalSus/features/maps/domain/repositories/maps_repository.dart';
import 'package:meta/meta.dart';

class MapsRepositoryImpl extends MapsRepository {
  final MapsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  MapsRepositoryImpl(
      {@required this.localDataSource, @required this.networkInfo});

  @override
  Future<Either<Failure, City>> getCityServices(String city) async {
    try {
      String currentCity = city;

      if (currentCity == null) {
        currentCity = await localDataSource.getUserLocation();
      }

      print(currentCity);

      return Right(await localDataSource.getCityDataFromJson(currentCity));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
