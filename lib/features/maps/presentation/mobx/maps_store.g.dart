// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maps_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapsStore on _MapsStore, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;

  final _$_resultsFutureAtom = Atom(name: '_MapsStore._resultsFuture');

  @override
  ObservableFuture<Either<Failure, List<SearchResult>>> get _resultsFuture {
    _$_resultsFutureAtom.context.enforceReadPolicy(_$_resultsFutureAtom);
    _$_resultsFutureAtom.reportObserved();
    return super._resultsFuture;
  }

  @override
  set _resultsFuture(
      ObservableFuture<Either<Failure, List<SearchResult>>> value) {
    _$_resultsFutureAtom.context.conditionallyRunInAction(() {
      super._resultsFuture = value;
      _$_resultsFutureAtom.reportChanged();
    }, _$_resultsFutureAtom, name: '${_$_resultsFutureAtom.name}_set');
  }

  final _$resultsAtom = Atom(name: '_MapsStore.results');

  @override
  List<SearchResult> get results {
    _$resultsAtom.context.enforceReadPolicy(_$resultsAtom);
    _$resultsAtom.reportObserved();
    return super.results;
  }

  @override
  set results(List<SearchResult> value) {
    _$resultsAtom.context.conditionallyRunInAction(() {
      super.results = value;
      _$resultsAtom.reportChanged();
    }, _$resultsAtom, name: '${_$resultsAtom.name}_set');
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

  final _$searchResultsAsyncAction = AsyncAction('searchResults');

  @override
  Future searchResults(String searchString) {
    return _$searchResultsAsyncAction
        .run(() => super.searchResults(searchString));
  }
}
