import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:saudeMentalSus/features/google/services/geolocator_service.dart';
import 'package:saudeMentalSus/features/maps/data/models/city_model.dart';
import 'package:saudeMentalSus/features/maps/data/sources/maps_launcher.dart';

class GenerateListCards {
  final geoLocatorService = GeoLocatorService();
  Future<List<Widget>> generate(BuildContext context, List<CityModel> cities,
      LatLng currentPosition) async {
    List<Widget> cards = [];
    MapsLauncher m = new MapsLauncher();

    for (var city in cities) {
      for (var service in city.servicesList) {
        final distance = ((currentPosition.latitude != 0) &&
                (currentPosition.longitude != 0))
            ? await geoLocatorService.getDistance(
                currentPosition.latitude,
                currentPosition.longitude,
                service.institution.address.geolocationPoint.latitude,
                service.institution.address.geolocationPoint.longitude)
            : null;
        final card = Card(
          child: ListTile(
            title: Text(service.institution.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 3.0,
                ),
                (distance != null)
                    ? Text('Distância: ${(distance).round()} m')
                    : Text('N/A')
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.directions),
              color: Theme.of(context).primaryColor,
              onPressed: () => m.openMapsSheet(
                  context,
                  service.institution.name,
                  service.institution.address.geolocationPoint.latitude,
                  service.institution.address.geolocationPoint.longitude),
            ),
          ),
        );
        cards.add(card);
      }
    }
    return cards;
  }
}
