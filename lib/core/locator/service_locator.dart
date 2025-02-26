import 'package:get_it/get_it.dart';

import '../../data/datasources/local/shared_preferences_service.dart';
import '../../data/repositories/authentication.repository.dart';

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
}
