import 'package:flutter/material.dart';

import '../../../common/common.dart';
import '../../../core/core.dart';
import '../../../data/models/models.dart';

class TCuisinesCarousel extends StatelessWidget {
  const TCuisinesCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: TSizes.size12,
      children: [
        /// Section Heading - Cuisines
        TSectionHeading(
          title: TTexts.cuisines,
          horizontal: TSizes.defaultSpace,
          onPressed: () {},
        ),

        TCarouselView(
          widthFactor: 0.30,
          backgroundColor: TColors.black,
          maxHeight: TSizes.size60,
          borderRadius: TSizes.size30,
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          children:
              demoCuisines.map((CuisineModel cuisine) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(cuisine.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      cuisine.cuisine,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall!.apply(color: TColors.white),
                    ),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}
