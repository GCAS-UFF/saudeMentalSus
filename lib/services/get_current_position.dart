import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:saude_mental_sus/core/error/failure.dart';
import 'package:saude_mental_sus/core/usecases/usecase.dart';
import 'package:saude_mental_sus/repository/interfaces/maps_repository.dart';

class GetCurrentPosition extends UseCase<Position, NoParams> {
  final MapsRepository mapsRepository;

  GetCurrentPosition(this.mapsRepository);

  @override
  Future<Either<Failure, Position>> call(NoParams noParams) async {
    return await mapsRepository.getCurrentPosition();
  }
}
