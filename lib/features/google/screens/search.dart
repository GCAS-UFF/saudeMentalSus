import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:saudeMentalSus/features/google/screens/tabs/show_map.dart';
import 'package:saudeMentalSus/features/google/services/marker_service.dart';
import 'package:saudeMentalSus/features/maps/data/models/city_model.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final currentPosition = Provider.of<Position>(context);
    final citiesProvider = Provider.of<Future<List<CityModel>>>(context);

    final markerService = MarkerService(
        latitude: currentPosition.latitude,
        longitude: currentPosition.longitude);

    return FutureProvider(
      create: (context) => citiesProvider,
      child: Scaffold(
        body: (currentPosition != null)
            ? Consumer<List<CityModel>>(
                builder: (_, cities, __) {
                  var markers = (cities != null)
                      ? markerService.getMarkers(context, cities)
                      : List<Marker>();
                  return (cities != null)
                      ? ShowMap(
                          currentPosition: LatLng(currentPosition.latitude,
                              currentPosition.longitude),
                          markers: markers,
                        )
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
