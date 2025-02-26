import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/core.dart';
import 'data/datasources/datasources.dart';
import 'data/repositories/repositories.dart';
import 'presentation/presentation.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => AuthenticationCubit(
            authenticationRepository: locator<AuthenticationRepository>(),
            sharedPreferencesService: locator<SharedPreferencesService>(),
          )..checkStatus(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: TAppTheme.lightTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
