import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/core.dart';
import '../cubit/onboarding_cubit.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      count: 3,
      controller: context.read<OnboardingCubit>().pageController,
      onDotClicked:
          (index) => context.read<OnboardingCubit>().dotNavigationClick(index),
      effect: ScrollingDotsEffect(
        fixedCenter: false,
        dotWidth: TSizes.size14,
        dotHeight: TSizes.size14,
        dotColor: TColors.primary.withValues(alpha: 0.2),
        activeDotColor: TColors.primary,
      ),
    );
  }
}
