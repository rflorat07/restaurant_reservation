import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../widgets/widgets.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    return Scaffold(
      appBar: OnBoardingSkip(),
      backgroundColor: TColors.quinary,
      body: Column(
        children: [
          Flexible(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {},
              physics: const ClampingScrollPhysics(),
              children: [
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
          Container(
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
                OnBoardingDotNavigation(pageController: pageController),

                /// OnBoarding Next Button
                const OnBoardingNextButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
