// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SplashController on _SplashStore, Store {
  Computed<StoreState>? _$stateComputed;

  @override
  StoreState get state => (_$stateComputed ??=
          Computed<StoreState>(() => super.state, name: '_SplashStore.state'))
      .value;

  final _$_dataLoadedFutureAtom = Atom(name: '_SplashStore._dataLoadedFuture');

  @override
  ObservableFuture<Either<Failure, bool>>? get _dataLoadedFuture {
    _$_dataLoadedFutureAtom.reportRead();
    return super._dataLoadedFuture;
  }

  @override
  set _dataLoadedFuture(ObservableFuture<Either<Failure, bool>>? value) {
    _$_dataLoadedFutureAtom.reportWrite(value, super._dataLoadedFuture, () {
      super._dataLoadedFuture = value;
    });
  }

  final _$isDataLoadedAtom = Atom(name: '_SplashStore.isDataLoaded');

  @override
  bool get isDataLoaded {
    _$isDataLoadedAtom.reportRead();
    return super.isDataLoaded;
  }

  @override
  set isDataLoaded(bool value) {
    _$isDataLoadedAtom.reportWrite(value, super.isDataLoaded, () {
      super.isDataLoaded = value;
    });
  }

  final _$_currentPositionFutureAtom =
      Atom(name: '_SplashStore._currentPositionFuture');

  @override
  ObservableFuture<Either<Failure, Position>>? get _currentPositionFuture {
    _$_currentPositionFutureAtom.reportRead();
    return super._currentPositionFuture;
  }

  @override
  set _currentPositionFuture(
      ObservableFuture<Either<Failure, Position>>? value) {
    _$_currentPositionFutureAtom
        .reportWrite(value, super._currentPositionFuture, () {
      super._currentPositionFuture = value;
    });
  }

  final _$currentPositionAtom = Atom(name: '_SplashStore.currentPosition');

  @override
  Position? get currentPosition {
    _$currentPositionAtom.reportRead();
    return super.currentPosition;
  }

  @override
  set currentPosition(Position? value) {
    _$currentPositionAtom.reportWrite(value, super.currentPosition, () {
      super.currentPosition = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_SplashStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$loadDataAsyncAction = AsyncAction('_SplashStore.loadData');

  @override
  Future<dynamic> loadData() {
    return _$loadDataAsyncAction.run(() => super.loadData());
  }

  final _$getCurrentPositionAsyncAction =
      AsyncAction('_SplashStore.getCurrentPosition');

  @override
  Future<dynamic> getCurrentPosition() {
    return _$getCurrentPositionAsyncAction
        .run(() => super.getCurrentPosition());
  }

  @override
  String toString() {
    return '''
isDataLoaded: ${isDataLoaded},
currentPosition: ${currentPosition},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
