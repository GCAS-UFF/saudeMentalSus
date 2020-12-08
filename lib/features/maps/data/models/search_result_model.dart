import 'package:saudeMentalSus/features/maps/domain/entities/search_result.dart';
import 'package:meta/meta.dart';

class SearchResultModel extends SearchResult {
  SearchResultModel({@required services, @required type})
      : super(services: services, type: type);
}
