import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:saudeMentalSus/core/util/getValueFromEnum.dart';
import 'package:saudeMentalSus/features/google/services/geolocator_service.dart';
import 'package:saudeMentalSus/features/maps/data/models/city_model.dart';
import 'package:saudeMentalSus/features/maps/data/sources/maps_launcher.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/service.dart';

class MarkerService {
  final m = MapsLauncher();
  final geoLocatorService = GeoLocatorService();

  double latitude;
  double longitude;

  MarkerService({@required this.latitude, @required this.longitude});

  List<Marker> getMarkers(BuildContext context, List<CityModel> cities) {
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
              service.institution.address.longitude),
          onTap: () => _showCard(context, service),
        );

        markers.add(marker);
      });
    });

    return markers;
  }

  _showCard(BuildContext context, Service service) async {
    final distance = ((latitude != 0) && (longitude != 0))
        ? await geoLocatorService.getDistance(
            latitude,
            longitude,
            service.institution.address.latitude,
            service.institution.address.longitude)
        : null;
    showModalBottomSheet(
        elevation: 0,
        barrierColor: Colors.black.withAlpha(1),
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
              color: Colors.white,
              height: (MediaQuery.of(context).size.height * 0.35),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text(service.institution.name),
                    subtitle: Text(
                        '${getValueFromEnum(service.institution.institutionType)} • ${(distance != null) ? (distance).round().toString() + 'm' : 'N/A'}'),
              
                    trailing: IconButton(
                      icon: Icon(Icons.directions),
                      color: Theme.of(context).primaryColor,
                      onPressed: () => m.openMapsSheet(
                          context,
                          service.institution.name,
                          service.institution.address.latitude,
                          service.institution.address.longitude),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text(service.institution.address.toString()),
                  ),
                  Visibility(
                    visible: (service.institution.emails.length != 0),
                    child: Expanded(
                      child: ListView.builder(
                          itemCount: service.institution.emails.length,
                          itemBuilder: (context, index) => ListTile(
                                leading: (index == 0)
                                    ? Icon(Icons.alternate_email)
                                    : null,
                                title: Text(service.institution.emails[index]),
                              )),
                    ),
                  ),
                  Visibility(
                    visible: (service.institution.phones.length != 0),
                    child: Expanded(
                      child: ListView.builder(
                          itemCount: service.institution.phones.length,
                          itemBuilder: (context, index) => ListTile(
                                leading:
                                    (index == 0) ? Icon(Icons.phone) : null,
                                title: Text(service.institution.phones[index]),
                              )),
                    ),
                  ),
                ],
              ));
        });
  }
}
