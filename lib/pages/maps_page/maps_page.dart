import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:saudeMentalSus/core/util/getInfo.dart';
import 'package:saudeMentalSus/data/entities/search_result.dart';
import 'package:saudeMentalSus/data/entities/service.dart';
import 'package:saudeMentalSus/widgets/maps_launcher_widget.dart';
import 'package:saudeMentalSus/pages/maps_page/controller/maps_controller.dart';
import 'package:saudeMentalSus/widgets/generate_list_items.dart';
import 'package:saudeMentalSus/widgets/show_mapa_page.dart';
import 'package:saudeMentalSus/widgets/menu_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../injection_container.dart';

class MapsPage extends StatefulWidget {
  final LatLng currentPosition;

  const MapsPage({required this.currentPosition});

  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  MapsLauncherWidget mapsLauncher = MapsLauncherWidget();
  int currentIndex = 0;
  late MapsController _mapsStore;
  late List<ReactionDisposer> _disposers;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _mapsStore = sl.get<MapsController>();
    _disposers = [
      reaction(
        (_) => _mapsStore.errorMessage,
        (String message) => {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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
      key: _scaffoldKey,
      drawer: new MenuWidget(),
      body: Stack(children: <Widget>[
        Observer(
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
        Container(
            child: Align(
                alignment: Alignment(-0.40, 0.97),
                child: FloatingActionButton.extended(
                  onPressed: () {
                    launch("tel:${192}");
                  },
                  icon: Icon(Icons.call),
                  label: Text('SAMU'),
                  backgroundColor: Color(0xffd90429),
                ))),
        Container(
            child: Align(
                alignment: Alignment(0.40, 0.97),
                child: FloatingActionButton.extended(
                  onPressed: () {
                    launch("tel:${188}");
                  },
                  icon: Icon(Icons.call),
                  label: Text('CVV'),
                  backgroundColor: Color(0xffd90429),
                )))
      ]),
    );
  }

  List<Marker> _getMarkers(List<SearchResult> results) {
    List<Marker> markers = [];
    results.forEach((result) {
      result.services.value.forEach((service) {
        markers.add(Marker(
            onTap: () {
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
    return Center(
        child: ShowMap(
      scaffoldkey: _scaffoldKey,
      currentPosition: widget.currentPosition,
      markers: markes,
    ));
  }

  _showCard(BuildContext context, Service service) async {
    final lineFreeSpace = MediaQuery.of(context).size.width * 0.25;
    final distance = ((widget.currentPosition.latitude != 0) &&
            (widget.currentPosition.longitude != 0))
        ? Geolocator.distanceBetween(
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
          return DraggableScrollableSheet(
            maxChildSize: 1,
            minChildSize: 0.3,
            builder: (BuildContext context, ScrollController scrollController) {
              return SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          )),
                      child: Column(mainAxisSize: MainAxisSize.min, children: <
                          Widget>[
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30))),
                            child: Column(children: <Widget>[
                              ListTile(
                                title: Text(service.name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                subtitle: Text(
                                    '${GetInfo.getValueFromEnum(service.institutionType)} • ${(distance != null) ? (distance).round().toString() + 'm' : 'N/A'}',
                                    style: TextStyle(color: Colors.white)),
                                trailing: IconButton(
                                    icon: Icon(Icons.directions,
                                        color: Colors.white, size: 35.0),
                                    color: Theme.of(context).primaryColor,
                                    onPressed: () async {
                                      try {
                                        mapsLauncher.openMapsSheet(
                                            context,
                                            service.name,
                                            service.address.geolocationPoint
                                                .latitude,
                                            service.address.geolocationPoint
                                                .longitude);
                                      } catch (e) {
                                        print(e.toString());
                                      }
                                    }),
                              ),
                            ])),
                        ListTile(
                          leading: Icon(Icons.location_on, color: Colors.blue),
                          title: Text(service.address.toString()),
                        ),
                        GenerateListItems.generateListTile(
                            service.phones, Icons.phone),
                        GenerateListItems.generateListTile(
                            service.emails, Icons.alternate_email),
                        GenerateListItems.generateOpeningHours(
                            service.receptions),
                        SizedBox(height: 10),
                        Text('Coordenadores',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        (service.coords.length != 0)
                            ? ListView.separated(
                                shrinkWrap: true,
                                primary: false,
                                itemCount: service.coords.length,
                                separatorBuilder: (context, index) => Divider(
                                    indent: lineFreeSpace,
                                    endIndent: lineFreeSpace,
                                    color: Colors.grey),
                                itemBuilder: (context, index) {
                                  return Container(
                                    child: Column(
                                      children: [
                                        ListTile(
                                          leading: Icon(
                                            Icons.person,
                                            color: Colors.blue,
                                          ),
                                          title:
                                              Text(service.coords[index].name),
                                          subtitle: Text(
                                              GetInfo.getValueFromEnum(service
                                                  .coords[index].coordType)),
                                        ),
                                        GenerateListItems.generateListTile(
                                            service.coords[index].phones,
                                            Icons.phone),
                                        GenerateListItems.generateListTile(
                                            service.coords[index].emails,
                                            Icons.alternate_email),
                                      ],
                                    ),
                                  );
                                })
                            : Text('Não existem coordenadores'),
                      ])));
            },
          );
        });
  }
}
