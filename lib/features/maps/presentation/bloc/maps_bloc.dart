import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/city.dart';
import 'package:saudeMentalSus/features/maps/domain/usecases/get_city_services.dart';

part 'maps_event.dart';
part 'maps_state.dart';

class MapsBloc extends Bloc<MapsEvent, MapsState> {
  final GetCityServices getCityServices;

  MapsBloc({@required this.getCityServices}) : assert(getCityServices != null) {
    this.add(GetCityServicesEvent(city: null));
  }

  @override
  MapsState get initialState => MapsInitial();

  @override
  Stream<MapsState> mapEventToState(
    MapsEvent event,
  ) async* {
    if (event is GetCityServicesEvent) {
      yield Loading();
      var cityOrError = await getCityServices(Params(city: event.city));
      yield cityOrError.fold(
        (failure) => Error(error: failure.toMessage()),
        (city) {
          print(city
              .servicesList[0].institution.address.geolocationPoint.latitude);
          print(city
              .servicesList[0].institution.address.geolocationPoint.longitude);
          return Loaded(city: city);
        },
      );
    }
  }
}
