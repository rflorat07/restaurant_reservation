import 'package:flutter/material.dart';

import '../../core.dart';

class TTabBarTheme {
  TTabBarTheme._();

  static TabBarTheme lightTabBarTheme = TabBarTheme(
    indicator: const BoxDecoration(
      border: Border(
        bottom: BorderSide(width: TSizes.size4, color: TColors.primary),
      ),
    ),
    indicatorSize: TabBarIndicatorSize.tab,
    dividerColor: Colors.black.withValues(alpha: 0.1),
    labelStyle: const TextStyle(
      color: TColors.primary,
      fontSize: TSizes.fontSize14,
      fontWeight: FontWeight.w500,
    ),
    unselectedLabelStyle: const TextStyle(
      color: TColors.dark,
      fontSize: TSizes.fontSize14,
      fontWeight: FontWeight.w400,
    ),
  );

  static TabBarTheme darkTabBarTheme = TabBarTheme(
    indicator: const BoxDecoration(
      border: Border(
        bottom: BorderSide(width: TSizes.size4, color: TColors.primary),
      ),
    ),
    indicatorColor: TColors.primary,
    indicatorSize: TabBarIndicatorSize.tab,
    dividerColor: Colors.black.withValues(alpha: 0.1),
    labelStyle: const TextStyle(
      color: TColors.primary,
      fontSize: TSizes.fontSize14,
      fontWeight: FontWeight.w500,
    ),
    unselectedLabelStyle: const TextStyle(
      color: TColors.dark,
      fontSize: TSizes.fontSize14,
      fontWeight: FontWeight.w400,
    ),
  );
}
