import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/core.dart';
import 'presentation/home/cubit/special_offer/special_offer_cubit.dart';
import 'presentation/presentation.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationCubit>(
          create:
              (context) =>
                  locator<AuthenticationCubit>()..checkAuthenticationStatus(),
        ),
        BlocProvider<LocationCubit>(
          create: (context) => locator<LocationCubit>()..fetchLocation(),
        ),
        BlocProvider<RestaurantsCubit>(
          create: (context) => locator<RestaurantsCubit>(),
        ),
        BlocProvider<NavigationMenuCubit>(
          create: (context) => locator<NavigationMenuCubit>(),
        ),
        BlocProvider<SpecialOfferCubit>(
          create: (context) => locator<SpecialOfferCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: TAppTheme.lightTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
