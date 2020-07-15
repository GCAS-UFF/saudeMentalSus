part of 'maps_bloc.dart';

abstract class MapsState extends Equatable {
  const MapsState();
}

class MapsInitial extends MapsState {
  @override
  List<Object> get props => [];
}

class Loading extends MapsState {
  @override
  List<Object> get props => [];
}

class Loaded extends MapsState {
  final City city;

  Loaded({@required this.city});

  @override
  List<Object> get props => [city];
}

class Error extends MapsState {
  final String error;

  Error({@required this.error});

  @override
  List<Object> get props => [error];
}
