import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sabegra_saude_mental/core/error/failure.dart';
import 'package:sabegra_saude_mental/core/usecases/usecase.dart';
import 'package:sabegra_saude_mental/data/entities/search_result.dart';
import 'package:sabegra_saude_mental/repository/interfaces/maps_repository.dart';

class SearchServices extends UseCase<List<SearchResult>, Params> {
  final MapsRepository mapsRepository;

  SearchServices(this.mapsRepository);

  @override
  Future<Either<Failure, List<SearchResult>>> call(Params params) async {
    return await mapsRepository.searchServices(params.searchString);
  }
}

class Params extends Equatable {
  final String searchString;

  Params({required this.searchString});

  @override
  List<Object> get props => [searchString];
}
