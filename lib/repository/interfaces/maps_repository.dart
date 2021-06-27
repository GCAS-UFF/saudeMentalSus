import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:saudeMentalSus/core/error/failure.dart';
import 'package:saudeMentalSus/data/entities/search_result.dart';

abstract class MapsRepository {
  Future<Either<Failure, List<SearchResult>>> searchServices(
      String searchString);
  Future<Either<Failure, Position>> getCurrentPosition();
}
