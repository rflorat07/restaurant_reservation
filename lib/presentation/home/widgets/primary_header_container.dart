import 'package:flutter/material.dart';

import '../../../core/core.dart';
import 'dropdown_location.dart';
import 'search_filter.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: TSizes.size8,
        left: TSizes.defaultSpace,
        bottom: TSizes.defaultSpace,
        right: TSizes.defaultSpace,
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.bottomRight,
          image: AssetImage(TImages.homeHeader),
        ),
        color: TColors.primary,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(TSizes.size20),
          bottomLeft: Radius.circular(TSizes.size20),
        ),
      ),
      child: const Column(
        spacing: TSizes.spaceBtwItems,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // DropdownMenu location - Icon notification
          TDropdownlocation(),

          // Search - Filter
          TSearchFilter(),
        ],
      ),
    );
  }
}
