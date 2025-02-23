import 'package:flutter/material.dart';

import '../../../core/core.dart';
import 'widgets.dart';

class OnBoardingNavigation extends StatelessWidget {
  const OnBoardingNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: TSizes.defaultSpace,
        right: TSizes.defaultSpace,
        bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      ),
      color: TColors.white,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// OnBoarding Back Button
          OnBoardingBackButton(),

          /// Dot Navigation SmoothPageIndicator
          OnBoardingDotNavigation(),

          /// OnBoarding Next Button
          OnBoardingNextButton(),
        ],
      ),
    );
  }
}
