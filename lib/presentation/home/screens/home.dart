import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../widgets/cuisines_carousel.dart';
import '../widgets/primary_header_container.dart';
import '../widgets/special_offer_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0.0, backgroundColor: TColors.primary),
      body: const SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          spacing: TSizes.size18,
          children: [
            /// Header
            TPrimaryHeaderContainer(),

            /// Special Offer Carousel
            TSpecialOfferCarousel(),

            /// Cuisines Carousel
            TCuisinesCarousel(),
          ],
        ),
      ),
    );
  }
}
