import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:saudeMentalSus/features/google/services/geolocator_service.dart';
import 'package:saudeMentalSus/features/maps/data/models/city_model.dart';
import 'package:saudeMentalSus/features/maps/data/sources/maps_launcher.dart';

class GenerateListCards {
  List<Widget> generate(BuildContext context, List<CityModel> cities,
      GeoLocatorService geoLocatorService, Position currentPosition) {
    List<Widget> cards = [];
    MapsLauncher m = new MapsLauncher();

    cities.forEach((city) {
      city.servicesList.forEach((service) async {
        final distance = await geoLocatorService.getDistance(
            currentPosition.latitude,
            currentPosition.longitude,
            service.institution.address.latitude,
            service.institution.address.longitude);

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
                    ? Text('\u00b7 ${(distance).round()} m')
                    : Container()
              ],
            ),
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
        );

        cards.add(card);
      });
    });
    return cards;
  }
}
