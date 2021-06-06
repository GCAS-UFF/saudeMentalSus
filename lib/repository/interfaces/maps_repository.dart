import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:saude_mental_sus/core/error/failure.dart';
import 'package:saude_mental_sus/data/entities/search_result.dart';

abstract class MapsRepository {
  Future<Either<Failure, List<SearchResult>>> searchServices(
      String searchString);
  Future<Either<Failure, Position>> getCurrentPosition();
}
