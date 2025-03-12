import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../common/widgets/icons/t_circular_icon.dart';
import '../../../core/core.dart';

class TSearchFilter extends StatelessWidget {
  const TSearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: TSizes.size8,
      children: [
        // Search bar
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.only(left: TSizes.spaceBtwItems),
              height: TSizes.inputMaxHeight,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(TSizes.size8)),
              ),
              child: Row(
                children: [
                  const Icon(
                    IconsaxPlusLinear.search_normal_1,
                    color: TColors.primary,
                    size: TSizes.size18,
                  ),
                  const SizedBox(width: TSizes.size8),
                  Text(
                    TTexts.search,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.apply(color: TColors.darkerGrey),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Filter
        TCircularIcon(
          icon: IconsaxPlusLinear.setting_4,
          iconColor: TColors.primary,
          size: TSizes.size18,
          backgroundColor: Colors.white,
          width: TSizes.inputMaxHeight,
          height: TSizes.inputMaxHeight,
          borderRadius: TSizes.size8,
          onPressed: () {},
        ),
      ],
    );
  }
}
