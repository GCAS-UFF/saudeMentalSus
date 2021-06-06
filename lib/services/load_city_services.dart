import 'package:dartz/dartz.dart';
import 'package:saude_mental_sus/core/error/failure.dart';
import 'package:saude_mental_sus/core/usecases/usecase.dart';
import 'package:saude_mental_sus/repository/interfaces/splash_repository.dart';

class LoadCityServices extends UseCase<bool, NoParams> {
  final SplashRepository splashRepository;

  LoadCityServices(this.splashRepository);

  @override
  Future<Either<Failure, bool>> call(NoParams noParams) async {
    return await splashRepository.loadCityServices();
  }
}
