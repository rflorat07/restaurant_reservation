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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// OnBoarding Back Button
          const OnBoardingBackButton(),

          /// Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          /// OnBoarding Next Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
