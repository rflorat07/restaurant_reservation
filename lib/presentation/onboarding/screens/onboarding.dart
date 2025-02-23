import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../auth/screens/signin/signin.dart';
import '../cubit/onboarding_cubit.dart';
import '../widgets/widgets.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OnBoardingSkip(
        onPressed: () {
          AppNavigator.pushAndRemove(context, const SignInScreen());
        },
      ),
      backgroundColor: TColors.quinary,
      body: BlocProvider(
        create: (context) => OnboardingCubit(),
        child: const OnboardingPage(),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        if (state.status == OnBoardingStatus.completed) {
          AppNavigator.pushAndRemove(context, const SignInScreen());
        }
      },
      child: Column(
        children: [
          Flexible(
            child: PageView(
              controller: context.read<OnboardingCubit>().pageController,
              onPageChanged:
                  (index) => context
                      .read<OnboardingCubit>()
                      .updatePageIndicator(index),
              physics: const ClampingScrollPhysics(),
              children: const [
                OnBoardingPage(
                  title: TTexts.onBoardingTitle1,
                  description: TTexts.onBoardingDescription1,
                  image: TImages.onBoardingImage1,
                ),
                OnBoardingPage(
                  title: TTexts.onBoardingTitle2,
                  description: TTexts.onBoardingDescription2,
                  image: TImages.onBoardingImage2,
                ),
                OnBoardingPage(
                  title: TTexts.onBoardingTitle3,
                  description: TTexts.onBoardingDescription3,
                  image: TImages.onBoardingImage3,
                ),
              ],
            ),
          ),
          const OnBoardingNavigation(),
        ],
      ),
    );
  }
}
