import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:saudeMentalSus/features/maps/data/models/city_model.dart';
import 'package:saudeMentalSus/features/maps/presentation/app_bar_search.dart';
import 'package:saudeMentalSus/features/maps/presentation/show_mapa.dart';

class Search extends StatefulWidget {
  final LatLng currentPosition;

  const Search({Key key, @required this.currentPosition}) : super(key: key);
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSearch(),
      //body: Container(),
      body: ShowMap(
        currentPosition: widget.currentPosition,
        markers: [],
      ),
    );
  }
}
