import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:saudeMentalSus/core/error/failure.dart';
import 'package:saudeMentalSus/core/usecases/usecase.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/city.dart';
import 'package:meta/meta.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/geolocation_point.dart';
import 'package:saudeMentalSus/features/maps/domain/repositories/maps_repository.dart';

class GetCityServices extends UseCase<City, Params> {
  final MapsRepository mapsRepository;

  GetCityServices(this.mapsRepository);

  @override
  Future<Either<Failure, City>> call(Params params) async {
    return await mapsRepository.getCityServices(params.city);
  }
}

class Params extends Equatable {
  final String city;

  Params({@required this.city});

  @override
  List<Object> get props => [city];
}
