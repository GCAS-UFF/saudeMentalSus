import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Reception extends Equatable {
  final DateTime openingHour;
  final DateTime closingHour;
  final int weekDay;

  Reception(
      {@required this.openingHour,
      @required this.closingHour,
      @required this.weekDay});

  @override
  List<Object> get props => [openingHour, closingHour, weekDay];
}
