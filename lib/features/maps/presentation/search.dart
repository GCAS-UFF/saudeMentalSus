import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/search_result.dart';
import 'package:saudeMentalSus/features/maps/presentation/app_bar_search.dart';
import 'package:saudeMentalSus/features/maps/presentation/show_mapa.dart';
import '../../../injection_container.dart';

import 'mobx/maps_store.dart';

class Search extends StatefulWidget {
  final LatLng currentPosition;

  const Search({Key key, @required this.currentPosition}) : super(key: key);
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int currentIndex = 0;
  MapsStore _mapsStore;
  List<ReactionDisposer> _disposers;
  GlobalKey<ScaffoldState> _sacaffoldKey = GlobalKey();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _mapsStore ??= sl<MapsStore>();
    _disposers ??= [
      reaction(
        (_) => _mapsStore.errorMessage,
        (String message) => {
          _sacaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text(message),
          ))
        },
      ),
    ];
  }

  @override
  void dispose() {
    _disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSearch(),
      //body: Container(),
      body: Observer(
        builder: (_) {
          switch (_mapsStore.state) {
            case StoreState.initial:
              return _buildBody(context, []);
            case StoreState.loading:
              return Center(child: CircularProgressIndicator());
            case StoreState.loaded:
              return Center(
                child: _buildBody(context, _getMarkers(_mapsStore.results)),
              );
          }
        },
      ),
    );
  }

  List<Marker> _getMarkers(List<SearchResult> results) {
    List<Marker> markers = [];
    results.forEach((result) {
      result.services.value.forEach((service) {
        markers.add(Marker(
            position: LatLng(service.address.geolocationPoint.latitude,
                service.address.geolocationPoint.longitude),
            markerId: MarkerId(markers.length.toString())));
      });
    });

    return markers;
  }

  Widget _buildBody(BuildContext context, List<Marker> markes) {
    return ShowMap(
      currentPosition: widget.currentPosition,
      markers: markes,
    );
  }
}
