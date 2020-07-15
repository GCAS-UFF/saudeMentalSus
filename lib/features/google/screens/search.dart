import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:saudeMentalSus/features/google/screens/tabs/show_list_cards.dart';
import 'package:saudeMentalSus/features/google/screens/tabs/show_map.dart';
import 'package:saudeMentalSus/features/google/services/marker_service.dart';
import 'package:saudeMentalSus/features/maps/presentation/bloc/maps_bloc.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final currentPosition =
        Position(latitude: -22.8992365, longitude: -43.1131186);
    final markerService = MarkerService();

    return Scaffold(
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
        body: BlocListener<MapsBloc, MapsState>(listener: (context, state) {
          if (state is Error) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
        }, child: BlocBuilder<MapsBloc, MapsState>(builder: (context, state) {
          if (state is Loaded) {
            var markers = (state.city != null)
                ? markerService.getMarkers([state.city])
                : List<Marker>();
            return (state.city != null)
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
                        cities: [state.city],
                      )
                    ],
                  )
                : Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        })));
  }
}
