import 'package:flutter/material.dart';

import '../../../core/core.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    this.icon,
    this.textStyle,
    this.onPressed,
    this.textColor,
    this.buttonColor,
    required this.title,
    this.vertical = 0.0,
    this.textButtonStyle,
    this.horizontal = 0.0,
    this.showActionButton = true,
    this.buttonTitle = TTexts.seeAll,
  });

  final Widget? icon;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;
  final double vertical, horizontal;
  final Color? textColor, buttonColor;
  final TextStyle? textStyle, textButtonStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style:
                textStyle ??
                Theme.of(
                  context,
                ).textTheme.headlineSmall!.apply(color: textColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (showActionButton)
            TextButton.icon(
              onPressed: onPressed,
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              icon: icon,
              label: Text(
                buttonTitle,
                style:
                    textButtonStyle ??
                    Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: buttonColor ?? TColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}
