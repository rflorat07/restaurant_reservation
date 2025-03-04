import 'package:get_it/get_it.dart';

import '../../data/datasources/datasources.dart';
import '../../data/repositories/repositories.dart';
import '../../presentation/presentation.dart';

final locator = GetIt.instance;

Future<void> serviceLocatorInit() async {
  // Init SharedPreferencesService
  final sharedPreferencesService = SharedPreferencesService();
  await sharedPreferencesService.init();

  // Services
  locator.registerSingleton<SharedPreferencesService>(
    SharedPreferencesService(),
  );

  // Repositories
  locator.registerSingleton<AuthenticationRepository>(
    AuthenticationRepository(),
  );

  locator.registerSingleton<LocationRepository>(LocationRepository());

  // Cubits
  locator.registerSingleton<AuthenticationCubit>(
    AuthenticationCubit(
      authenticationRepository: locator<AuthenticationRepository>(),
      sharedPreferencesService: locator<SharedPreferencesService>(),
    ),
  );

  locator.registerSingleton<LocationCubit>(
    LocationCubit(locationRepository: locator<LocationRepository>()),
  );
}
