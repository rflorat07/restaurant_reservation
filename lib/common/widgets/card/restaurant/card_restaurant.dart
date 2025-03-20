import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../core/core.dart';
import '../../../../data/models/models.dart';
import '../../../common.dart';

class TCardRestaurant extends StatelessWidget {
  const TCardRestaurant({super.key, required this.restaurant});

  final RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(TSizes.size16),
      child: Container(
        color: TColors.quinary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Restaurant Image
            TRoundedContainer(
              height: 160,
              width: double.infinity,
              imageUrl: restaurant.photos[0].photoReference,
              isNetworkImage: true,
              isBorderRadiusCircular: false,
              padding: const EdgeInsets.only(
                top: TSizes.size12,
                left: TSizes.size12,
                right: TSizes.size12,
              ),
              child: const Stack(
                children: [
                  Positioned(
                    right: 0,
                    child: TCircularIcon(
                      width: 35,
                      height: 35,
                      size: TSizes.size20,
                      icon: IconsaxPlusBold.heart,
                      iconColor: TColors.secondary,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: TRoundedContainer(
                      isBorderRadiusCircular: false,
                      padding: EdgeInsets.symmetric(
                        horizontal: TSizes.size8,
                        vertical: TSizes.size4,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(TSizes.size12),
                        topRight: Radius.circular(TSizes.size12),
                      ),
                      child: Row(
                        spacing: TSizes.size4,
                        children: [
                          Icon(
                            IconsaxPlusBold.discount_shape,
                            color: TColors.seaGreen,
                            size: 16,
                          ),
                          Text(
                            '10% OFF',
                            style: TextStyle(
                              color: TColors.seaGreen,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.all(TSizes.size12),
              child: Column(
                spacing: TSizes.size4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Restaurant Name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          restaurant.name,
                          style: Theme.of(context).textTheme.titleMedium!.apply(
                            color: TColors.black,
                            fontWeightDelta: 2,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          const Icon(
                            Icons.star,
                            color: TColors.starYellow,
                            size: TSizes.size18,
                          ),
                          Text(restaurant.rating.toString()),
                        ],
                      ),
                    ],
                  ),

                  /// Restaurant Details
                  Row(
                    spacing: TSizes.size4,
                    children: [
                      const Icon(
                        IconsaxPlusBold.clock,
                        color: TColors.primary,
                        size: TSizes.size16,
                      ),
                      Text(
                        restaurant.openingHours.openNow ? 'Abierto' : 'Cerrado',
                        style: Theme.of(context).textTheme.labelMedium!.apply(
                          color: TColors.quaternary,
                        ),
                      ),
                      const Icon(
                        IconsaxPlusBold.wallet_2,
                        color: TColors.primary,
                        size: TSizes.size16,
                      ),
                      Text(
                        restaurant.getPriceLevelString(),
                        style: Theme.of(context).textTheme.labelMedium!.apply(
                          color: TColors.quaternary,
                        ),
                      ),
                      const Icon(
                        IconsaxPlusBold.reserve,
                        color: TColors.primary,
                        size: TSizes.size16,
                      ),
                      Text(
                        'No disponible',
                        style: Theme.of(context).textTheme.labelMedium!.apply(
                          color: TColors.quaternary,
                        ),
                      ),
                    ],
                  ),

                  /// Restaurant Address
                  Row(
                    spacing: TSizes.size4,
                    children: [
                      const Icon(
                        IconsaxPlusBold.location,
                        color: TColors.primary,
                        size: TSizes.size16,
                      ),
                      Text(
                        restaurant.vicinity,
                        style: Theme.of(context).textTheme.labelMedium!.apply(
                          color: TColors.quaternary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
