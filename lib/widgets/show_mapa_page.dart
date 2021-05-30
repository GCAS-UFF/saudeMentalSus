import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class ShowMap extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldkey;
  final LatLng currentPosition;
  final List<Marker> markers;

  const ShowMap(
      {Key? key,
      required this.currentPosition,
      required this.markers,
      required this.scaffoldkey})
      : super(key: key);
  @override
  _ShowMapState createState() => _ShowMapState();
}

class _ShowMapState extends State<ShowMap> {
  late GoogleMapController mapController;
  String searchAddr = '';
  final TextEditingController _textController = new TextEditingController();

  late Set<Marker> markers;

  @override
  void initState() {
    super.initState();
    markers = Set<Marker>.of(widget.markers);
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    bool flag = ((widget.currentPosition.latitude == 0) &&
        (widget.currentPosition.longitude == 0));
    return Stack(children: <Widget>[
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          mapToolbarEnabled: false,
          onMapCreated: _onMapCreated,
          myLocationEnabled: (flag) ? false : true,
          myLocationButtonEnabled: false,
          initialCameraPosition: CameraPosition(
              target: (flag)
                  ? LatLng(-15.7801, -47.9292)
                  : LatLng(widget.currentPosition.latitude,
                      widget.currentPosition.longitude),
              zoom: (flag) ? 0 : 16.0),
          zoomGesturesEnabled: true,
          markers: markers,
          //onTap: ,
        ),
      ),
      Positioned(
        top: 30.0,
        right: 15.0,
        left: 15.0,
        child: Container(
            height: 50.0,
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0.0),
                  color: Colors.white),
              child: Row(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.blue,
                      ),
                      onPressed: () => Scaffold.of(context).openDrawer()),
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Buscar",
                      ),
                      onChanged: (val) {
                        setState(() {
                          searchAddr = val;
                        });
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      searchnavigate();
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      _textController.clear();
                    },
                  ),
                ],
              ),
            )),
      )
    ]);
  }

  searchnavigate() {
    locationFromAddress(searchAddr).then((result) {
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(result[0].latitude, result[0].longitude),
        zoom: 13.0,
      )));
    });
  }
}
