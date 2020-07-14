import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:saudeMentalSus/core/platform/network_info.dart';
import 'package:saudeMentalSus/features/maps/data/datasources/maps_local_data_source.dart';
import 'package:saudeMentalSus/features/maps/domain/repositories/maps_repository.dart';
import 'package:saudeMentalSus/features/maps/domain/usecases/get_city_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/maps/data/repositories/maps_repository_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //init features
  _initMaps();

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => Geolocator()..forceAndroidLocationManager);
}

_initMaps() {
  // Use cases
  sl.registerLazySingleton(() => GetCityServices(sl()));

  // Repository
  sl.registerLazySingleton<MapsRepository>(
    () => MapsRepositoryImpl(
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<MapsLocalDataSource>(
    () => MapsLocalDataSourceImpl(geolocator: sl()),
  );
}
