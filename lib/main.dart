import 'package:flutter/material.dart';

import 'app.dart';
import 'core/locator/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// -- Initialize Service Locator
  await serviceLocatorInit();

  runApp(const App());
}
