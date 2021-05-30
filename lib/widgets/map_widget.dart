import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  final LatLng currentPosition;
  final List<Marker> markers;

  const MapWidget({required this.currentPosition, required this.markers});
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late GoogleMapController mapController;
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
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        myLocationEnabled: (flag) ? false : true,
        myLocationButtonEnabled: true,
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
    );
  }
}
