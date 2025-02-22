import 'package:flutter/material.dart';

import '../../../core/core.dart';

class OnBoardingSkip extends StatelessWidget implements PreferredSizeWidget {
  const OnBoardingSkip({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              TTexts.onboardingSkip,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: TColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
