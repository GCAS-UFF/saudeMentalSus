import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                      leading: SvgPicture.asset(map.icon),
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
