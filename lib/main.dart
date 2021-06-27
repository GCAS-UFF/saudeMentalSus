import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saudeMentalSus/pages/maps_page/controller/maps_controller.dart';
import 'package:saudeMentalSus/pages/splash_page/controller/splash_controller.dart';
import 'package:saudeMentalSus/pages/splash_page/splash_page.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MentalPlus());
}

class MentalPlus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sabegra Saúde Mental',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          Provider<SplashController>(
            create: (_) => di.sl<SplashController>(),
          ),
          Provider<MapsController>(
            create: (_) => di.sl<MapsController>(),
          ),
        ],
        child: SplashPage(),
      ),
    );
  }
}
