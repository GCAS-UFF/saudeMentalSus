import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:saude_mental_sus/core/error/failure.dart';
import 'package:saude_mental_sus/core/usecases/usecase.dart';
import 'package:saude_mental_sus/services/current_position_service.dart';
import 'package:saude_mental_sus/services/load_city_services.dart';

part 'splash_controller.g.dart';

class SplashController extends _SplashStore with _$SplashController {
  SplashController(LoadCityServices loadCityServices,
      CurrentPositionService getCurrentPosition)
      : super(loadCityServices, getCurrentPosition);
}

enum StoreState { initial, loading, loaded }

abstract class _SplashStore with Store {
  late final LoadCityServices _loadCityServices;
  late final CurrentPositionService _getCurrentPosition;

  _SplashStore(this._loadCityServices, this._getCurrentPosition) {
    getCurrentPosition();
    loadData();
  }

  //Splash flow variables
  @observable
  ObservableFuture<Either<Failure, bool>>? _dataLoadedFuture;
  @observable
  bool isDataLoaded = false;

  // Get current position variables
  @observable
  ObservableFuture<Either<Failure, Position>>? _currentPositionFuture;
  @observable
  Position? currentPosition;

  @observable
  String errorMessage = "";

  @computed
  StoreState get state {
    if ((_dataLoadedFuture == null ||
            _dataLoadedFuture!.status == FutureStatus.rejected) ||
        (_currentPositionFuture == null ||
            _currentPositionFuture!.status == FutureStatus.rejected)) {
      return StoreState.initial;
    }
    return (_dataLoadedFuture!.status == FutureStatus.pending ||
            _currentPositionFuture!.status == FutureStatus.pending)
        ? StoreState.loading
        : StoreState.loaded;
  }

  @action
  Future loadData() async {
    errorMessage = "";
    _dataLoadedFuture = ObservableFuture(_loadCityServices(NoParams()));
    var boollOrError = await _dataLoadedFuture;
    boollOrError!.fold((l) {
      errorMessage = l.toString();
    }, (r) {
      isDataLoaded = r;
    });
  }

  @action
  Future getCurrentPosition() async {
    print("chamei");
    errorMessage = "";
    _currentPositionFuture = ObservableFuture(_getCurrentPosition(NoParams()));
    var positionOrError = await _currentPositionFuture;
    positionOrError!.fold((l) {
      errorMessage = l.toString();
      print("Erro: $errorMessage");
    }, (position) {
      currentPosition = position;
    });
  }
}
