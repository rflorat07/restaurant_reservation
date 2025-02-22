import 'package:flutter/material.dart';

import '../../../common/common.dart';
import '../../../core/constants/constants.dart';
import '../../../core/helpers/helpers.dart';
import '../../../core/navigator/app_navigator.dart';
import '../../auth/screens/signin/signin.dart';
import '../../onboarding/screens/onboarding.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        spacing: TSizes.defaultSpace,
        children: [
          Image.asset(
            fit: BoxFit.cover,
            TImages.welcome,
            width: double.infinity,
            height: THelperFunctions.screenHeight(context) * 0.55,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.size24),
            child: Column(
              spacing: TSizes.defaultSpace,
              children: [
                const TRichTextDescription(
                  text: TTexts.welcomeTitle,
                  description: TTexts.welcomeSubTitle,
                ),
                TBasicElevatedButton(
                  title: TTexts.welcomeButton,
                  onPressed:
                      () => AppNavigator.pushAndRemove(
                        context,
                        const OnboardingScreen(),
                      ),
                ),
                TRichTextTap(
                  text: TTexts.welcomeSignIn,
                  onTap:
                      () => AppNavigator.pushAndRemove(
                        context,
                        const SignInScreen(),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
