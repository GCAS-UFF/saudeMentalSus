import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:saudeMentalSus/core/error/failure.dart';
import 'package:saudeMentalSus/core/usecases/usecase.dart';
import 'package:saudeMentalSus/features/maps/domain/repositories/maps_repository.dart';

import '../../../../core/usecases/usecase.dart';

class GetCurrentPosition extends UseCase<Position, NoParams> {
  final MapsRepository mapsRepository;

  GetCurrentPosition(this.mapsRepository);

  @override
  Future<Either<Failure, Position>> call(NoParams noParams) async {
    return await mapsRepository.getCurrentPosition();
  }
}
