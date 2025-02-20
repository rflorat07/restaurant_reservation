import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: Center(
        child: Column(
          spacing: TSizes.spaceBtwItems,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(TSizes.size68 / 2),
              child: SizedBox(
                width: TSizes.size68,
                height: TSizes.size68,
                child: Image.asset(TImages.splashLogo, fit: BoxFit.cover),
              ),
            ),
            Text(
              TTexts.splashTitle,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: TColors.textWhite,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
