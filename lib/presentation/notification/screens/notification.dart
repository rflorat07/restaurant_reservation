import 'package:flutter/material.dart';

import '../../../common/common.dart';
import '../../../core/core.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            spacing: TSizes.size36,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                fit: BoxFit.cover,
                TImages.notification,
                width: TSizes.size118,
                height: TSizes.size118,
              ),
              Column(
                spacing: TSizes.size16,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    TTexts.notificationTitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    TTexts.notificationSubTitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: TColors.textSecondary,
                    ),
                  ),
                ],
              ),
              TBasicElevatedButton(
                title: TTexts.notificationButton,
                onPressed: () {},
              ),

              TextButton(
                onPressed: () {},
                child: Text(
                  TTexts.notificationManualButton,
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium!.copyWith(color: TColors.textPrimary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
