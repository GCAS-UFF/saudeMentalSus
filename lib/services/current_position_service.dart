import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:saudeMentalSus/core/error/failure.dart';
import 'package:saudeMentalSus/core/usecases/usecase.dart';
import 'package:saudeMentalSus/repository/interfaces/maps_repository.dart';

class CurrentPositionService extends UseCase<Position, NoParams> {
  final MapsRepository mapsRepository;

  CurrentPositionService(this.mapsRepository);

  @override
  Future<Either<Failure, Position>> call(NoParams noParams) async {
    return await mapsRepository.getCurrentPosition();
  }
}
