import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowMap extends StatefulWidget {
  final LatLng currentPosition;
  final List<Marker> markers;

  const ShowMap(
      {Key key, @required this.currentPosition, @required this.markers})
      : super(key: key);
  @override
  _ShowMapState createState() => _ShowMapState();
}

class _ShowMapState extends State<ShowMap> {
  GoogleMapController mapController;
  Set<Marker> markers;

  @override
  void initState() {
    super.initState();
    markers = Set<Marker>.of(widget.markers);
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _focusOnMarker(LatLng markerPosition) {
    mapController.moveCamera(CameraUpdate.newLatLng(markerPosition));
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