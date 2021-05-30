import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sabegra_saude_mental/core/error/failure.dart';
import 'package:sabegra_saude_mental/core/usecases/usecase.dart';
import 'package:sabegra_saude_mental/repository/interfaces/maps_repository.dart';

class GetCurrentPosition extends UseCase<Position, NoParams> {
  final MapsRepository mapsRepository;

  GetCurrentPosition(this.mapsRepository);

  @override
  Future<Either<Failure, Position>> call(NoParams noParams) async {
    return await mapsRepository.getCurrentPosition();
  }
}
