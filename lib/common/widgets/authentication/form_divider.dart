import 'package:flutter/material.dart';

import '../../../core/core.dart';

class TFormDivider extends StatelessWidget {
  const TFormDivider({
    super.key,
    required this.dividerText,
    this.padding = const EdgeInsets.all(8.0),
  });

  final String dividerText;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Divider(
              color: dark ? TColors.dividerColor : TColors.dividerColor,
              thickness: 1,
              indent: 36,
              endIndent: 5,
            ),
          ),
          Text(
            dividerText,
            style: Theme.of(
              context,
            ).textTheme.labelLarge!.apply(color: TColors.darkerGrey),
          ),
          Flexible(
            child: Divider(
              color: dark ? TColors.dividerColor : TColors.dividerColor,
              thickness: 1,
              indent: 5,
              endIndent: 36,
            ),
          ),
        ],
      ),
    );
  }
}
