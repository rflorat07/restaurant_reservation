import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../presentation.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationWelcome) {
          AppNavigator.pushAndRemoveWithoutAnimation(
            context,
            const WelcomeScreen(),
          );
        } else if (state is AuthenticationSignIn) {
          AppNavigator.pushAndRemoveWithoutAnimation(
            context,
            const SignInScreen(),
          );
        } else if (state is AuthenticationHome) {
          AppNavigator.pushAndRemoveWithoutAnimation(
            context,
            const NotificationScreen(),
          );
        }
      },
      child: Scaffold(
        backgroundColor: TColors.primary,
        body: Center(
          child: Column(
            spacing: TSizes.spaceBtwItems,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(TSizes.size68 / 2),
                child: SizedBox(
                  width: TSizes.size68,
                  height: TSizes.size68,
                  child: Image.asset(TImages.splashLogo, fit: BoxFit.cover),
                ),
              ),
              Text(
                TTexts.splashTitle,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: TColors.textWhite,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
