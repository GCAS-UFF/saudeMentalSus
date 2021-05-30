import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sabegra_saude_mental/core/error/failure.dart';
import 'package:sabegra_saude_mental/data/entities/search_result.dart';

abstract class MapsRepository {
  Future<Either<Failure, List<SearchResult>>> searchServices(
      String searchString);
  Future<Either<Failure, Position>> getCurrentPosition();
}
