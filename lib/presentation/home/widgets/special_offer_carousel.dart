import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../common/common.dart';
import '../../../core/core.dart';
import '../../../data/models/models.dart';

class TSpecialOfferCarousel extends StatelessWidget {
  const TSpecialOfferCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    return Column(
      children: [
        // CarouselView
        TCarouselView(
          widthFactor: 0.9,
          backgroundColor: TColors.black,
          maxHeight: TSizes.size165,
          children:
              demoSpecialOffer
                  .map(
                    (specialOffer) =>
                        SpecialOfferCard(specialOffer: specialOffer),
                  )
                  .toList(),
        ),

        const SizedBox(height: TSizes.defaultSpace / 2),

        // PageIndicator
        SmoothPageIndicator(
          count: 5,
          controller: pageController,
          effect: ScrollingDotsEffect(
            fixedCenter: false,
            dotWidth: TSizes.size10,
            dotHeight: TSizes.size10,
            dotColor: TColors.primary.withValues(alpha: 0.2),
            activeDotColor: TColors.primary,
          ),
        ),
      ],
    );
  }
}
