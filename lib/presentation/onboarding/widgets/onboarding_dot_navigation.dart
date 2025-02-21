import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/core.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
      child: SmoothPageIndicator(
        count: 3,
        controller: pageController,
        onDotClicked: (index) {},
        effect: ScrollingDotsEffect(
          fixedCenter: false,
          dotWidth: TSizes.size14,
          dotHeight: TSizes.size14,
          dotColor: TColors.primary.withValues(alpha: 0.2),
          activeDotColor: TColors.primary,
        ),
      ),
    );
  }
}
