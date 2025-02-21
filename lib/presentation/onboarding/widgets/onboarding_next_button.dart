import 'package:flutter/material.dart';

import '../../../core/core.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {},
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: EdgeInsets.zero,
        fixedSize: const Size(TSizes.size48, TSizes.size48),
        backgroundColor: TColors.primary,
      ),
      child: const Icon(Icons.arrow_forward, color: TColors.white),
    );
  }
}
