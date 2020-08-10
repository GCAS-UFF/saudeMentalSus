// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maps_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapsStore on _MapsStore, Store {
  Computed<MapStoreState> _$stateComputed;

  @override
  MapStoreState get state =>
      (_$stateComputed ??= Computed<MapStoreState>(() => super.state)).value;

  final _$_cityFutureAtom = Atom(name: '_MapsStore._cityFuture');

  @override
  ObservableFuture<Either<Failure, City>> get _cityFuture {
    _$_cityFutureAtom.context.enforceReadPolicy(_$_cityFutureAtom);
    _$_cityFutureAtom.reportObserved();
    return super._cityFuture;
  }

  @override
  set _cityFuture(ObservableFuture<Either<Failure, City>> value) {
    _$_cityFutureAtom.context.conditionallyRunInAction(() {
      super._cityFuture = value;
      _$_cityFutureAtom.reportChanged();
    }, _$_cityFutureAtom, name: '${_$_cityFutureAtom.name}_set');
  }

  final _$cityAtom = Atom(name: '_MapsStore.city');

  @override
  City get city {
    _$cityAtom.context.enforceReadPolicy(_$cityAtom);
    _$cityAtom.reportObserved();
    return super.city;
  }

  @override
  set city(City value) {
    _$cityAtom.context.conditionallyRunInAction(() {
      super.city = value;
      _$cityAtom.reportChanged();
    }, _$cityAtom, name: '${_$cityAtom.name}_set');
  }

  final _$errorMessageAtom = Atom(name: '_MapsStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.context.enforceReadPolicy(_$errorMessageAtom);
    _$errorMessageAtom.reportObserved();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.context.conditionallyRunInAction(() {
      super.errorMessage = value;
      _$errorMessageAtom.reportChanged();
    }, _$errorMessageAtom, name: '${_$errorMessageAtom.name}_set');
  }

  final _$getCityAsyncAction = AsyncAction('getCity');

  @override
  Future getCity(String cityName) {
    return _$getCityAsyncAction.run(() => super.getCity(cityName));
  }
}
