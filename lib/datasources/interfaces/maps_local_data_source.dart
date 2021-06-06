import 'package:geolocator/geolocator.dart';
import 'package:saude_mental_sus/data/models/search_result_model.dart';

abstract class MapsLocalDataSource {
  Future<List<SearchResultModel>> searchServices(String searchString);
  Future<Position> getUserLocation();
}
