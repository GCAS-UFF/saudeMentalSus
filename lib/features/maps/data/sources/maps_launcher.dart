import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';

class MapsLauncher {
  openMapsSheet(BuildContext context, String localName, double latitude,
      double longitude) async {
    try {
      final coords = Coords(latitude, longitude);
      final avaibleMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Container(
                    child: Wrap(children: <Widget>[
                  for (var map in avaibleMaps)
                    ListTile(
                      title: Text(map.mapName),
                      leading: Image(
                        image: map.icon,
                        height: 30,
                        width: 30,
                      ),
                      onTap: () => map.showMarker(
                          coords: coords, title: localName, description: null),
                    )
                ])),
              ),
            );
          });
    } catch (e) {
      print(e.toString());
    }
  }
}
