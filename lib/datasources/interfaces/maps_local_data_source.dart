import 'package:geolocator/geolocator.dart';
import 'package:sabegra_saude_mental/data/models/search_result_model.dart';

abstract class MapsLocalDataSource {
  Future<List<SearchResultModel>> searchServices(String searchString);
  Future<Position> getUserLocation();
}
