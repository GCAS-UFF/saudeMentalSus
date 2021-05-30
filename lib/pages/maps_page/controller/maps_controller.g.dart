// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maps_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapsController on _MapsStore, Store {
  Computed<StoreState>? _$stateComputed;

  @override
  StoreState get state => (_$stateComputed ??=
          Computed<StoreState>(() => super.state, name: '_MapsStore.state'))
      .value;

  final _$_resultsFutureAtom = Atom(name: '_MapsStore._resultsFuture');

  @override
  ObservableFuture<Either<Failure, List<SearchResult>>>? get _resultsFuture {
    _$_resultsFutureAtom.reportRead();
    return super._resultsFuture;
  }

  @override
  set _resultsFuture(
      ObservableFuture<Either<Failure, List<SearchResult>>>? value) {
    _$_resultsFutureAtom.reportWrite(value, super._resultsFuture, () {
      super._resultsFuture = value;
    });
  }

  final _$resultsAtom = Atom(name: '_MapsStore.results');

  @override
  List<SearchResult> get results {
    _$resultsAtom.reportRead();
    return super.results;
  }

  @override
  set results(List<SearchResult> value) {
    _$resultsAtom.reportWrite(value, super.results, () {
      super.results = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_MapsStore.errorMessage');

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

  final _$searchResultsAsyncAction = AsyncAction('_MapsStore.searchResults');

  @override
  Future<dynamic> searchResults(String searchString) {
    return _$searchResultsAsyncAction
        .run(() => super.searchResults(searchString));
  }

  @override
  String toString() {
    return '''
results: ${results},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
