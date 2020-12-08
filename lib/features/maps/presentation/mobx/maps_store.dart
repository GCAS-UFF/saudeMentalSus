import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:saudeMentalSus/core/error/failure.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/search_result.dart';
import 'package:saudeMentalSus/features/maps/domain/usecases/search_services.dart';

part 'maps_store.g.dart';

class MapsStore extends _MapsStore with _$MapsStore {
  MapsStore(SearchServices searchServices) : super(searchServices);
}

enum StoreState { initial, loading, loaded }

abstract class _MapsStore with Store {
  final SearchServices _searchServices;

  _MapsStore(this._searchServices) {
    searchResults("Niterói");
  }

  @observable
  ObservableFuture<Either<Failure, List<SearchResult>>> _resultsFuture;
  @observable
  List<SearchResult> results;

  @observable
  String errorMessage;

  @computed
  StoreState get state {
    if ((_resultsFuture == null ||
        _resultsFuture.status == FutureStatus.rejected)) {
      return StoreState.initial;
    }
    return (_resultsFuture.status == FutureStatus.pending)
        ? StoreState.loading
        : StoreState.loaded;
  }

  @action
  Future searchResults(String searchString) async {
    errorMessage = null;
    _resultsFuture =
        ObservableFuture(_searchServices(Params(searchString: searchString)));
    var servicesOrError = await _resultsFuture;
    servicesOrError.fold((l) {
      errorMessage = l.toString();
    }, (services) {
      results = services;
    });
  }
}
