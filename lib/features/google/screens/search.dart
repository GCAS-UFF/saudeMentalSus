import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:saudeMentalSus/features/google/screens/tabs/show_list_cards.dart';
import 'package:saudeMentalSus/features/google/screens/tabs/show_map.dart';
import 'package:saudeMentalSus/features/google/services/generate_list_cards.dart';
import 'package:saudeMentalSus/features/google/services/geolocator_service.dart';
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

    final markerService = MarkerService();

    return FutureProvider(
      create: (context) => citiesProvider,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.map), title: Text("Mapa")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list), title: Text("Locais"))
            ]),
        body: (currentPosition != null)
            ? Consumer<List<CityModel>>(
                builder: (_, cities, __) {
                  var markers = (cities != null)
                      ? markerService.getMarkers(cities)
                      : List<Marker>();
                  return (cities != null)
                      ? IndexedStack(
                          index: currentIndex,
                          children: <Widget>[
                            ShowMap(
                              currentPosition: LatLng(currentPosition.latitude,
                                  currentPosition.longitude),
                              markers: markers,
                            ),
                            ShowListCards(
                              currentPosition: LatLng(currentPosition.latitude,
                                  currentPosition.longitude),
                              cities: cities,
                            )
                          ],
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
