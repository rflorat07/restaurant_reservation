import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../core/core.dart';

class AppSnackbar {
  static void show(
    BuildContext context, {
    required String message,
    Color backgroundColor = TColors.primary,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: backgroundColor,
          duration: duration,
          action: action,
          showCloseIcon: true,
          content: Row(
            spacing: TSizes.size4,
            children: <Widget>[
              const Icon(IconsaxPlusLinear.info_circle, color: Colors.white),
              Expanded(child: Text(message)),
            ],
          ),
        ),
      );
  }

  static void success(BuildContext context, String message) {
    show(context, message: message, backgroundColor: TColors.primary);
  }

  static void error(BuildContext context, String message) {
    show(context, message: message, backgroundColor: TColors.error);
  }

  static void warning(BuildContext context, String message) {
    show(context, message: message, backgroundColor: TColors.warning);
  }

  static void info(BuildContext context, String message) {
    show(context, message: message, backgroundColor: TColors.info);
  }
}
