import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:saudeMentalSus/core/error/failure.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/city.dart';
import 'package:saudeMentalSus/features/maps/domain/usecases/get_city_services.dart';

part 'maps_store.g.dart';

class MapsStore extends _MapsStore with _$MapsStore {
  MapsStore(GetCityServices getCityServices) : super(getCityServices);
}

enum MapStoreState { initial, loading, loaded }

abstract class _MapsStore with Store {
  final GetCityServices _getCityServices;

  _MapsStore(this._getCityServices);

  @observable
  ObservableFuture<Either<Failure, City>> _cityFuture;
  @observable
  City city;

  @observable
  String errorMessage;

  @computed
  MapStoreState get state {
    if (_cityFuture == null || _cityFuture.status == FutureStatus.rejected) {
      return MapStoreState.initial;
    }
    return _cityFuture.status == FutureStatus.pending
        ? MapStoreState.loading
        : MapStoreState.loaded;
  }

  @action
  Future getCity(String cityName) async {
    errorMessage = null;
    _cityFuture = ObservableFuture(_getCityServices(Params(city: cityName)));
    var cityOrError = await _cityFuture;
    cityOrError.fold((l) {
      errorMessage = l.toString();
    }, (r) {
      city = r;
    });
  }
}
