import 'package:flutter/material.dart';
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
      home: Scaffold(),
    );
  }
}
