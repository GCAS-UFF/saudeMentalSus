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

enum LocationState { initial, loading, loaded, rejected }

abstract class _SplashStore with Store {
  final LoadCityServices _loadCityServices;

  _SplashStore(this._loadCityServices) {
    _locationStatus = LocationState.initial;
    loadData();
    loadLocation();
  }

  @observable
  ObservableFuture<Either<Failure, bool>> _dataLoadedFuture;
  @observable
  bool isDataLoaded;

  @observable
  Position _currentPosition;
  @observable
  LocationState _locationStatus;

  @observable
  String errorMessage;

  @computed
  StoreState get state {
    if ((_dataLoadedFuture == null ||
            _dataLoadedFuture.status == FutureStatus.rejected) &&
        (_currentPosition == null ||
            _locationStatus == LocationState.rejected)) {
      return StoreState.initial;
    }
    return ((_dataLoadedFuture.status == FutureStatus.pending) &&
            (_locationStatus == LocationState.loading))
        ? StoreState.loading
        : StoreState.loaded;
  }

  @computed
  LatLng get location {
    return (_locationStatus == LocationState.loaded)
        ? LatLng(_currentPosition.latitude, _currentPosition.longitude)
        : LatLng(0, 0);
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

  @action
  void loadLocation() async {
    errorMessage = null;
    _locationStatus = LocationState.loading;
    final Geolocator geo = Geolocator()..forceAndroidLocationManager;
    try {
      Position pos =
          await geo.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      _currentPosition = pos;
      _locationStatus = LocationState.loaded;
    } catch (e) {
      errorMessage = e.toString();
      _locationStatus = LocationState.rejected;
    }
  }
}
