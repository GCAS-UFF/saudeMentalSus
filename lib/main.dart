import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:saudeMentalSus/features/maps/data/models/city_model.dart';
import 'package:saudeMentalSus/features/maps/data/datasources/maps_local_data_source.dart';
import 'core/error/failure.dart';
import 'features/maps/domain/entities/city.dart';
import 'features/maps/domain/usecases/get_city_services.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // debugPaintSizeEnabled = true;
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: di.sl<GetCityServices>()(
              Params(city: null),
            ),
            builder: (BuildContext context,
                AsyncSnapshot<Either<Failure, City>> snapshot) {
              if (snapshot.hasData) {
                return snapshot.data.fold(
                  (l) => Text(l.toString()),
                  (r) => Text(r.name),
                );
              } else {
                return Text("To loading");
              }
            },
          ),
        ),
      ),
    );
  }
}
