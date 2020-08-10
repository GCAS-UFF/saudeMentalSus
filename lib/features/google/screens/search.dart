import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:saudeMentalSus/features/google/screens/components/app_bar_search.dart';
import 'package:saudeMentalSus/features/google/screens/tabs/show_map.dart';
import 'package:saudeMentalSus/features/google/services/marker_service.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/city.dart';
import 'package:saudeMentalSus/features/maps/presentation/maps_store.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  MapsStore _mapsStore;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<ReactionDisposer> _disposers;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _mapsStore ??= Provider.of<MapsStore>(context);
    _disposers ??= [
      reaction((_) => _mapsStore.errorMessage, (String message) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(message),
        ));
      })
    ];
  }

  @override
  void dispose() {
    _disposers.forEach((d) => d());
    super.dispose();
  }

  Widget _buildLoading() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildMap(City city, Position currentPosition) {
    final markerService = MarkerService(
        latitude: (currentPosition == null || currentPosition.latitude == null)
            ? 0
            : currentPosition.latitude,
        longitude:
            (currentPosition == null || currentPosition.longitude == null)
                ? 0
                : currentPosition.longitude);

    var markers = (city != null)
        ? markerService.getMarkers(context, [city])
        : List<Marker>();
    return (city != null)
        ? ShowMap(
            currentPosition:
                LatLng(currentPosition.latitude, currentPosition.longitude),
            markers: markers,
          )
        : Center(child: CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSearch(),
      body: Observer(
        builder: (_) {
          switch (_mapsStore.state) {
            case MapStoreState.initial:
              return _buildLoading();
            case MapStoreState.loading:
              return _buildLoading();
            case MapStoreState.loaded:
              return _buildMap(
                  _mapsStore.city, Position(latitude: 0, longitude: 0));
          }
        },
      ),
    );
  }
}
