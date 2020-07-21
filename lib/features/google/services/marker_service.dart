import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:saudeMentalSus/core/util/getInfo.dart';
import 'package:saudeMentalSus/features/google/services/generate_list_items.dart';
import 'package:saudeMentalSus/features/google/services/geolocator_service.dart';
import 'package:saudeMentalSus/features/maps/data/models/city_model.dart';
import 'package:saudeMentalSus/features/maps/data/sources/maps_launcher.dart';
import 'package:saudeMentalSus/features/maps/domain/entities/service.dart';

class MarkerService {
  final m = MapsLauncher();
  final geoLocatorService = GeoLocatorService();

  double latitude;
  double longitude;

  MarkerService({@required this.latitude, @required this.longitude});

  List<Marker> getMarkers(BuildContext context, List<CityModel> cities) {
    var markers = List<Marker>();
    cities.forEach((city) {
      city.servicesList.forEach((service) {
        Marker marker = Marker(
          markerId: MarkerId(service.institution.name),
          draggable: false,
          consumeTapEvents: true,
          // icon: place.icon,
          infoWindow: InfoWindow(title: service.institution.name),
          position: LatLng(service.institution.address.latitude,
              service.institution.address.longitude),
          onTap: () => _showCard(context, service),
        );
        markers.add(marker);
      });
    });

    return markers;
  }

  _showCard(BuildContext context, Service service) async {
    final lineFreeSpace = MediaQuery.of(context).size.width * 0.25;
    final distance = ((latitude != 0) && (longitude != 0))
        ? await geoLocatorService.getDistance(
            latitude,
            longitude,
            service.institution.address.latitude,
            service.institution.address.longitude)
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
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        )),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text(service.institution.name),
                          subtitle: Text(
                              '${GetInfo.getValueFromEnum(service.institution.institutionType)} • ${(distance != null) ? (distance).round().toString() + 'm' : 'N/A'}'),
                          trailing: IconButton(
                            icon: Icon(Icons.directions),
                            color: Theme.of(context).primaryColor,
                            onPressed: () => m.openMapsSheet(
                                context,
                                service.institution.name,
                                service.institution.address.latitude,
                                service.institution.address.longitude),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.location_on),
                          title: Text(service.institution.address.toString()),
                        ),
                        GenerateListItems.generateListTile(
                            service.institution.phones, Icons.phone),
                        GenerateListItems.generateListTile(
                            service.institution.emails, Icons.alternate_email),
                        GenerateListItems.generateOpeningHours(
                            service.receptions),
                        SizedBox(height: 10),
                        Text('Coordenadores', style: TextStyle(fontSize: 20)),
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
                                          leading: Icon(Icons.person),
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
                            : Text('Não existem coordenadores')
                      ],
                    )),
              );
            },
          );
        });
  }
}
