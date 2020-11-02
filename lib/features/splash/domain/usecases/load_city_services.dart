import 'package:dartz/dartz.dart';
import 'package:saudeMentalSus/core/error/failure.dart';
import 'package:saudeMentalSus/core/usecases/usecase.dart';
import 'package:saudeMentalSus/features/splash/domain/repositories/splash_repository.dart';

class LoadCityServices extends UseCase<bool, NoParams> {
  final SplashRepository splashRepository;

  LoadCityServices(this.splashRepository);

  @override
  Future<Either<Failure, bool>> call(NoParams noParams) async {
    return await splashRepository.loadCityServices();
  }
}
