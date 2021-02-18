import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:saudeMentalSus/core/util/getInfo.dart';
import 'package:saudeMentalSus/features/maps/data/sources/maps_launcher.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/search_result.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/service.dart';
import 'package:saudeMentalSus/features/maps/presentation/app_bar_search.dart';
import 'package:saudeMentalSus/features/maps/presentation/show_mapa.dart';
import '../../../injection_container.dart';

import 'mobx/maps_store.dart';

MapsLauncher mapsLauncher;
GetInfo getInfo = GetInfo();

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
            onTap: () {
              print('tocou');
              _showCard(context, service);
            },
            infoWindow: InfoWindow(
                title: service.name,
                snippet:
                    '${service.address.street}, ${service.address.houseNumber}'),
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

  _showCard(BuildContext context, Service service) async {
    final distance = ((widget.currentPosition.latitude != 0) &&
            (widget.currentPosition.longitude != 0))
        ? await Geolocator().distanceBetween(
            widget.currentPosition.latitude,
            widget.currentPosition.longitude,
            service.address.geolocationPoint.latitude,
            service.address.geolocationPoint.longitude)
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
                    title: Text(service.name),
                    subtitle: Text(
                        '${GetInfo.getValueFromEnum(service.institutionType)} • ${(distance != null) ? (distance).round().toString() + 'm' : 'N/A'}'),
                    trailing: IconButton(
                      icon: Icon(Icons.directions),
                      color: Theme.of(context).primaryColor,
                      onPressed: () => mapsLauncher.openMapsSheet(
                          context,
                          service.name,
                          service.address.geolocationPoint.latitude,
                          service.address.geolocationPoint.longitude),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text(service.address.toString()),
                  ),
                  Visibility(
                    visible: (service.emails.length != 0),
                    child: Expanded(
                      child: ListView.builder(
                          itemCount: service.emails.length,
                          itemBuilder: (context, index) => ListTile(
                                leading: (index == 0)
                                    ? Icon(Icons.alternate_email)
                                    : null,
                                title: Text(service.emails[index]),
                              )),
                    ),
                  ),
                  Visibility(
                    visible: (service.phones.length != 0),
                    child: Expanded(
                      child: ListView.builder(
                          itemCount: service.phones.length,
                          itemBuilder: (context, index) => ListTile(
                                leading:
                                    (index == 0) ? Icon(Icons.phone) : null,
                                title: Text(service.phones[index]),
                              )),
                    ),
                  ),
                ],
              ));
        });
  }
}
