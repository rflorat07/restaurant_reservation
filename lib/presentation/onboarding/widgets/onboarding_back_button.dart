import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../core/core.dart';

class OnBoardingBackButton extends StatelessWidget {
  const OnBoardingBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: double.minPositive,
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 15,
      child: ElevatedButton(
        onPressed: () => {},

        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: const CircleBorder(),
          fixedSize: const Size(TSizes.size48, TSizes.size48),
          backgroundColor: TColors.white,
        ),
        child: const Icon(IconsaxPlusLinear.arrow_left, color: TColors.primary),
      ),
    );
  }
}
