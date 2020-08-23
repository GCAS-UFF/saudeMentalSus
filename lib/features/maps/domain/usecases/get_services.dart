import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:saudeMentalSus/core/error/failure.dart';
import 'package:saudeMentalSus/core/usecases/usecase.dart';
import 'package:meta/meta.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/service.dart';
import 'package:saudeMentalSus/features/maps/domain/repositories/maps_repository.dart';

class GetServices extends UseCase<List<Service>, Params> {
  final MapsRepository mapsRepository;

  GetServices(this.mapsRepository);

  @override
  Future<Either<Failure, List<Service>>> call(Params params) async {
    return await mapsRepository.getCityServices(params.searchString);
  }
}

class Params extends Equatable {
  final String searchString;

  Params({@required this.searchString});

  @override
  List<Object> get props => [searchString];
}
