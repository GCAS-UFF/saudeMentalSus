import 'package:dartz/dartz.dart';
import 'package:sabegra_saude_mental/core/error/failure.dart';
import 'package:sabegra_saude_mental/core/usecases/usecase.dart';
import 'package:sabegra_saude_mental/repository/interfaces/splash_repository.dart';

class LoadCityServices extends UseCase<bool, NoParams> {
  final SplashRepository splashRepository;

  LoadCityServices(this.splashRepository);

  @override
  Future<Either<Failure, bool>> call(NoParams noParams) async {
    return await splashRepository.loadCityServices();
  }
}
