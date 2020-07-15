import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties;
  Failure([this.properties = const <dynamic>[]]);
  List<Object> get props => properties;

  String toMessage() {
    return "Erro desconhecido. Por favor reportar ao suporte";
  }
}

// General failures
class ServerFailure extends Failure {
  @override
  String toMessage() {
    return "Ocorreu um erro de servidor. Por favor reportar ao suporte";
  }
}

class CacheFailure extends Failure {}

class NoInternetConnectionFailure extends Failure {}
