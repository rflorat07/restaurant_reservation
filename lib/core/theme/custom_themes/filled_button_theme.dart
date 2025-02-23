import 'package:flutter/material.dart';

import '../../core.dart';

class TFilledButtonTheme {
  TFilledButtonTheme._();

  static FilledButtonThemeData lightFilledButtonThemeData =
      FilledButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStatePropertyAll(
            TTextTheme.lightTextTheme.titleMedium!.apply(color: TColors.white),
          ),
          backgroundColor: const WidgetStatePropertyAll(TColors.primary),
        ),
      );

  static FilledButtonThemeData darkFilledButtonThemeData =
      FilledButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStatePropertyAll(
            TTextTheme.lightTextTheme.titleMedium!.apply(color: TColors.white),
          ),
          backgroundColor: const WidgetStatePropertyAll(TColors.primary),
        ),
      );
}
