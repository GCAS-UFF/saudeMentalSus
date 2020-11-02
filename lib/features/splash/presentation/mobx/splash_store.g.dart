// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SplashStore on _SplashStore, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;

  final _$_dataLoadedFutureAtom = Atom(name: '_SplashStore._dataLoadedFuture');

  @override
  ObservableFuture<Either<Failure, bool>> get _dataLoadedFuture {
    _$_dataLoadedFutureAtom.context.enforceReadPolicy(_$_dataLoadedFutureAtom);
    _$_dataLoadedFutureAtom.reportObserved();
    return super._dataLoadedFuture;
  }

  @override
  set _dataLoadedFuture(ObservableFuture<Either<Failure, bool>> value) {
    _$_dataLoadedFutureAtom.context.conditionallyRunInAction(() {
      super._dataLoadedFuture = value;
      _$_dataLoadedFutureAtom.reportChanged();
    }, _$_dataLoadedFutureAtom, name: '${_$_dataLoadedFutureAtom.name}_set');
  }

  final _$isDataLoadedAtom = Atom(name: '_SplashStore.isDataLoaded');

  @override
  bool get isDataLoaded {
    _$isDataLoadedAtom.context.enforceReadPolicy(_$isDataLoadedAtom);
    _$isDataLoadedAtom.reportObserved();
    return super.isDataLoaded;
  }

  @override
  set isDataLoaded(bool value) {
    _$isDataLoadedAtom.context.conditionallyRunInAction(() {
      super.isDataLoaded = value;
      _$isDataLoadedAtom.reportChanged();
    }, _$isDataLoadedAtom, name: '${_$isDataLoadedAtom.name}_set');
  }

  final _$errorMessageAtom = Atom(name: '_SplashStore.errorMessage');

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

  final _$loadDataAsyncAction = AsyncAction('loadData');

  @override
  Future loadData() {
    return _$loadDataAsyncAction.run(() => super.loadData());
  }
}
