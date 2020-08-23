import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:saudeMentalSus/core/resources/images.dart';
import 'package:saudeMentalSus/features/google/screens/search.dart';
import 'package:saudeMentalSus/features/maps/presentation/maps_store.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // debugPaintSizeEnabled = true;
  await di.init();
  runApp(Google());
}

class Google extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => di.sl<MapsStore>(),
        ),
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
