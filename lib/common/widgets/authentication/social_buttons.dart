import 'package:flutter/material.dart';

import '../../../core/core.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.defaultSpace),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: TSizes.size64,
            width: TSizes.size64,
            decoration: BoxDecoration(
              border: Border.all(color: TColors.borderPrimary),
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Image(
                width: TSizes.size24,
                height: TSizes.size24,
                image: AssetImage(TImages.apple),
              ),
            ),
          ),
          const SizedBox(width: TSizes.defaultSpace / 2),
          Container(
            height: TSizes.size64,
            width: TSizes.size64,
            decoration: BoxDecoration(
              border: Border.all(color: TColors.borderPrimary),
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Image(
                width: TSizes.size24,
                height: TSizes.size24,
                image: AssetImage(TImages.google),
              ),
            ),
          ),
          const SizedBox(width: TSizes.defaultSpace / 2),
          Container(
            height: TSizes.size64,
            width: TSizes.size64,
            decoration: BoxDecoration(
              border: Border.all(color: TColors.borderPrimary),
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Image(
                width: TSizes.size24,
                height: TSizes.size24,
                image: AssetImage(TImages.facebook),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
