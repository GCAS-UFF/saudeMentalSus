import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/maps/presentation/mobx/maps_store.dart';
import 'features/splash/presentation/mobx/splash_store.dart';
import 'features/splash/presentation/pages/splash_page.dart';
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
    return MaterialApp(
      title: 'Saúde Mental SUS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          Provider<SplashStore>(
            create: (_) => di.sl<SplashStore>(),
          ),
          Provider<MapsStore>(
            create: (_) => di.sl<MapsStore>(),
          ),
        ],
        child: SplashPage(),
      ),
    );
  }
}
