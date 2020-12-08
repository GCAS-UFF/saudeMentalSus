import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:saudeMentalSus/core/error/failure.dart';
import 'package:saudeMentalSus/core/usecases/usecase.dart';
import 'package:saudeMentalSus/features/splash/domain/usecases/load_city_services.dart';

part 'splash_store.g.dart';

class SplashStore extends _SplashStore with _$SplashStore {
  SplashStore(LoadCityServices loadCityServices) : super(loadCityServices);
}

enum StoreState { initial, loading, loaded }

abstract class _SplashStore with Store {
  final LoadCityServices _loadCityServices;

  _SplashStore(this._loadCityServices) {
    loadData();
  }

  @observable
  ObservableFuture<Either<Failure, bool>> _dataLoadedFuture;
  @observable
  bool isDataLoaded;

  @observable
  String errorMessage;

  @computed
  StoreState get state {
    if ((_dataLoadedFuture == null ||
        _dataLoadedFuture.status == FutureStatus.rejected)) {
      return StoreState.initial;
    }
    return (_dataLoadedFuture.status == FutureStatus.pending)
        ? StoreState.loading
        : StoreState.loaded;
  }

  @action
  Future loadData() async {
    errorMessage = null;
    _dataLoadedFuture = ObservableFuture(_loadCityServices(NoParams()));
    var boollOrError = await _dataLoadedFuture;
    boollOrError.fold((l) {
      errorMessage = l.toString();
    }, (r) {
      isDataLoaded = r;
    });
  }
}
