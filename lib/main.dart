import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:saudeMentalSus/core/resources/images.dart';
import 'package:saudeMentalSus/features/google/screens/search.dart';
import 'package:saudeMentalSus/features/google/services/geolocator_service.dart';
import 'package:saudeMentalSus/features/maps/data/datasources/maps_local_data_source.dart';
import 'package:saudeMentalSus/features/maps/presentation/bloc/maps_bloc.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // debugPaintSizeEnabled = true;
  await di.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<MapsBloc>(
          create: (_) => di.sl<MapsBloc>(),
        ),
      ],
      child: Google(),
    ),
  );
}

class Google extends StatelessWidget {
  final locatorService = GeoLocatorService();
  final citiesService = MapsLocalDataSourceImpl();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider(create: (context) => locatorService.getLocation()),
        FutureProvider(create: (context) {
          ImageConfiguration configuration =
              createLocalImageConfiguration(context);
          return BitmapDescriptor.fromAssetImage(
              configuration, Images.map_marker);
        }),
      ],
      child: MaterialApp(
        title: 'Saúde Mental SUS',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Search(),
      ),
    );
  }
}
