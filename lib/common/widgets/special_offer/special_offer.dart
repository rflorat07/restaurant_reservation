import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../data/models/models.dart';
import '../../common.dart';

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    super.key,
    required this.specialOffer,
    this.height = TSizes.size165,
  });

  final double height;
  final SpecialOfferModel specialOffer;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: height,
      padding: const EdgeInsets.all(TSizes.size13),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            specialOffer.imageUrl,
          ), // CachedNetworkImageProvider(specialOffer.imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(TSizes.size16)),
      ),
      child: Column(
        spacing: TSizes.size10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Limited time!
          TRoundedContainer(
            radius: 50.0,
            backgroundColor: TColors.white,
            padding: const EdgeInsets.symmetric(
              vertical: TSizes.size4,
              horizontal: TSizes.size8,
            ),
            child: Text(
              specialOffer.offer,
              style: textTheme.labelSmall!.copyWith(
                fontWeight: FontWeight.w700,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),

          // Special Offer Text
          Text(
            specialOffer.title,
            overflow: TextOverflow.ellipsis,
            style: textTheme.headlineSmall,
          ),

          // Up to 40
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  specialOffer.upTo,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyMedium,
                ),
                const SizedBox(width: TSizes.size4),
                Text(
                  specialOffer.discount,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.headlineLarge,
                ),
              ],
            ),
          ),

          // Book Now
          TRoundedContainer(
            radius: 50.0,
            padding: const EdgeInsets.symmetric(
              vertical: TSizes.size6,
              horizontal: TSizes.size12,
            ),
            backgroundColor: TColors.primary,
            child: Text(
              specialOffer.cta,
              style: textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w600,
                color: TColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
