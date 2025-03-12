import 'package:flutter/material.dart';

import '../../../core/core.dart';

class TCarouselView extends StatelessWidget {
  const TCarouselView({
    super.key,
    this.onTap,
    required this.children,
    required this.maxHeight,
    required this.widthFactor,
    this.showBorderSide = false,
    this.backgroundColor = TColors.white,
    this.overlayColor = Colors.transparent,
    this.borderSideColor = TColors.borderPrimary,
    this.borderRadius = TSizes.size16,
    this.padding = const EdgeInsets.only(left: TSizes.defaultSpace),
  });

  final Color? overlayColor, backgroundColor;
  final List<Widget> children;
  final EdgeInsets padding;
  final double widthFactor, maxHeight, borderRadius;
  final Color borderSideColor;
  final bool showBorderSide;
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: CarouselView(
        onTap: onTap,
        itemSnapping: true,
        overlayColor: WidgetStateProperty.all(overlayColor),
        shrinkExtent: THelperFunctions.screenWidth(context) * widthFactor,
        itemExtent: THelperFunctions.screenWidth(context) * widthFactor,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side:
              showBorderSide
                  ? BorderSide(color: borderSideColor)
                  : BorderSide.none,
        ),
        padding: padding,
        children: children,
      ),
    );
  }
}
