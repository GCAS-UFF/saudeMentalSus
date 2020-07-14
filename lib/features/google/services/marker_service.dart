import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:saudeMentalSus/features/maps/data/models/city_model.dart';

class MarkerService {
  List<Marker> getMarkers(List<CityModel> cities) {
    var markers = List<Marker>();

    cities.forEach((city) {
      city.servicesList.forEach((service) {
        Marker marker = Marker(
            markerId: MarkerId(service.institution.name),
            draggable: false,
            // icon: place.icon,
            infoWindow: InfoWindow(
                title: service.institution.name), //snippet: place.vicinity),
            position: LatLng(service.institution.address.latitude,
                service.institution.address.longitude));

        markers.add(marker);
      });
    });

    return markers;
  }
}
