import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:saudeMentalSus/features/google/services/generate_list_cards.dart';
import 'package:saudeMentalSus/features/google/services/geolocator_service.dart';
import 'package:saudeMentalSus/features/google/services/marker_service.dart';
import 'package:saudeMentalSus/features/maps/data/models/city_model.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentPosition = Provider.of<Position>(context);
    final citiesProvider = Provider.of<Future<List<CityModel>>>(context);
    final geoService = GeoLocatorService();
    final markerService = MarkerService();
    final generateListCards = new GenerateListCards();

    return FutureProvider(
      create: (context) => citiesProvider,
      child: Scaffold(
        body: (currentPosition != null)
            ? Consumer<List<CityModel>>(
                builder: (_, cities, __) {
                  var markers = (cities != null)
                      ? markerService.getMarkers(cities)
                      : List<Marker>();
                  Set<Circle> circles = (currentPosition != null)
                      ? Set.from([
                          Circle(
                            circleId: CircleId("Current"),
                            center: LatLng(currentPosition.latitude,
                                currentPosition.longitude),
                          )
                        ])
                      : null;
                  return (cities != null)
                      ? Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: GoogleMap(
                            myLocationEnabled: true,
                            myLocationButtonEnabled: true,
                            initialCameraPosition: CameraPosition(
                                target: LatLng(currentPosition.latitude,
                                    currentPosition.longitude),
                                zoom: 16.0),
                            zoomGesturesEnabled: true,
                            markers: Set<Marker>.of(markers),
                            circles: circles,
                          ))
                      : Center(child: CircularProgressIndicator());
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
