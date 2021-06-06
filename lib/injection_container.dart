import 'package:get_it/get_it.dart';
import 'package:saude_mental_sus/datasources/implementacion/maps_local_data_source_impl.dart';
import 'package:saude_mental_sus/datasources/implementacion/splash_local_data_source_impl.dart';
import 'package:saude_mental_sus/datasources/interfaces/maps_local_data_source.dart';
import 'package:saude_mental_sus/pages/maps_page/controller/maps_controller.dart';
import 'package:saude_mental_sus/pages/splash_page/controller/splash_controller.dart';
import 'package:saude_mental_sus/repository/implementacion/maps_repository_impl.dart';
import 'package:saude_mental_sus/repository/implementacion/splash_repository_impl.dart';
import 'package:saude_mental_sus/repository/interfaces/maps_repository.dart';
import 'package:saude_mental_sus/repository/interfaces/splash_repository.dart';
import 'package:saude_mental_sus/services/current_position_service.dart';
import 'package:saude_mental_sus/services/load_city_services.dart';
import 'package:saude_mental_sus/services/search_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'datasources/interfaces/splash_local_data_source.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //init features
  _initSplash();
  _initMaps();

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}

_initMaps() {
  //Mobx
  sl.registerLazySingleton(
    () => MapsController(
      sl(),
    ),
  );
  // Use cases
  sl.registerLazySingleton(() => SearchServices(sl()));
  sl.registerLazySingleton(() => CurrentPositionService(sl()));

  // Repository
  sl.registerLazySingleton<MapsRepository>(
    () => MapsRepositoryImpl(
      localDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<MapsLocalDataSource>(
    () => MapsLocalDataSourceImpl(sharedPreferences: sl()),
  );
}

_initSplash() {
  //Mobx
  sl.registerLazySingleton(
    () => SplashController(
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
