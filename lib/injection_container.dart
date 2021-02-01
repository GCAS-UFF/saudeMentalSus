import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:saudeMentalSus/features/maps/data/datasources/maps_local_data_source.dart';
import 'package:saudeMentalSus/features/maps/domain/repositories/maps_repository.dart';
import 'package:saudeMentalSus/features/maps/domain/usecases/get_current_position.dart';
import 'package:saudeMentalSus/features/maps/domain/usecases/search_services.dart';
import 'package:saudeMentalSus/features/maps/presentation/mobx/maps_store.dart';
import 'package:saudeMentalSus/features/splash/data/datasources/splash_local_data_source.dart';
import 'package:saudeMentalSus/features/splash/domain/repositories/splash_repository.dart';
import 'package:saudeMentalSus/features/splash/domain/usecases/load_city_services.dart';
import 'package:saudeMentalSus/features/splash/presentation/mobx/splash_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/maps/data/repositories/maps_repository_impl.dart';
import 'features/splash/data/repositories/splash_repository_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //init features
  _initSplash();
  _initMaps();

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Geolocator()..forceAndroidLocationManager);
}

_initMaps() {
  //Mobx
  sl.registerLazySingleton(
    () => MapsStore(
      sl(),
    ),
  );
  // Use cases
  sl.registerLazySingleton(() => SearchServices(sl()));
  sl.registerLazySingleton(() => GetCurrentPosition(sl()));

  // Repository
  sl.registerLazySingleton<MapsRepository>(
    () => MapsRepositoryImpl(
      localDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<MapsLocalDataSource>(
    () => MapsLocalDataSourceImpl(geolocator: sl(), sharedPreferences: sl()),
  );
}

_initSplash() {
  //Mobx
  sl.registerLazySingleton(
    () => SplashStore(
      sl(),
      sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => LoadCityServices(sl()));

  // Repository
  sl.registerLazySingleton<SplashRepository>(
    () => SplashRepositoryImpl(
      localDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<SplashLocalDataSource>(
    () => SplashLocalDataSourceImpl(sharedPreferences: sl()),
  );
}
