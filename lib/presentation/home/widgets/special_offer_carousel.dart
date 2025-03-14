import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../common/common.dart';
import '../../../core/core.dart';
import '../../../data/models/models.dart';
import '../cubit/special_offer/special_offer_cubit.dart';

class TSpecialOfferCarousel extends StatelessWidget {
  const TSpecialOfferCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final specialOfferCubit = context.watch<SpecialOfferCubit>();

    return Column(
      children: [
        // CarouselView
        CarouselSlider(
          carouselController: specialOfferCubit.carouselController,
          options: CarouselOptions(
            initialPage: 0,
            viewportFraction: 1,
            height: TSizes.size165,
            enableInfiniteScroll: false,
            onPageChanged:
                (index, _) => specialOfferCubit.updateCurrentPageIndex(index),
          ),
          items:
              demoSpecialOffer
                  .map(
                    (specialOffer) =>
                        SpecialOfferCard(specialOffer: specialOffer),
                  )
                  .toList(),
        ),

        const SizedBox(height: TSizes.defaultSpace / 2),

        // PageIndicator
        AnimatedSmoothIndicator(
          activeIndex: specialOfferCubit.state.currentPageIndex,
          count: demoSpecialOffer.length,
          effect: ScrollingDotsEffect(
            fixedCenter: false,
            maxVisibleDots: demoSpecialOffer.length,
            dotWidth: TSizes.size10,
            dotHeight: TSizes.size10,
            activeDotColor: TColors.primary,
            dotColor: TColors.primary.withValues(alpha: 0.2),
          ),
        ),
      ],
    );
  }
}
