import 'package:flutter/material.dart';

import '../../../common/common.dart';
import '../../../core/core.dart';
import '../widgets/primary_header_container.dart';
import '../widgets/special_offer_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0.0, backgroundColor: TColors.primary),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            /// Header
            const TPrimaryHeaderContainer(),

            const SizedBox(height: TSizes.defaultSpace),

            /// Section Heading - SpecialForYou
            TSectionHeading(
              title: TTexts.specialOffers,
              horizontal: TSizes.defaultSpace,
              onPressed: () {},
            ),

            const SizedBox(height: TSizes.size12),

            /// Special Offer Carousel
            const TSpecialOfferCarousel(),
          ],
        ),
      ),
    );
  }
}
