part of 'maps_bloc.dart';

abstract class MapsEvent extends Equatable {
  const MapsEvent();
}

class GetCityServicesEvent extends MapsEvent {
  final String city;

  GetCityServicesEvent({@required this.city});

  @override
  List<Object> get props => [city];
}
