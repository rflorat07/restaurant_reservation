import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.child,
    this.width,
    this.onTap,
    this.height,
    this.margin,
    this.padding,
    this.imageUrl,
    this.borderRadius,
    this.showBorder = false,
    this.fit = BoxFit.cover,
    this.isNetworkImage = true,
    this.radius = TSizes.size16,
    this.borderWidth = TSizes.size1,
    this.isBorderRadiusCircular = true,
    this.backgroundColor = TColors.white,
    this.borderColor = TColors.borderPrimary,
  });

  final BoxFit? fit;
  final Widget? child;
  final Function()? onTap;
  final String? imageUrl;
  final Color borderColor;
  final Color backgroundColor;
  final double? width, height;
  final double radius, borderWidth;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final bool showBorder, isBorderRadiusCircular, isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius:
              isBorderRadiusCircular
                  ? BorderRadius.circular(radius)
                  : borderRadius,
          border:
              showBorder
                  ? Border.all(color: borderColor, width: borderWidth)
                  : null,
          image:
              imageUrl != null
                  ? isNetworkImage
                      ? DecorationImage(
                        image: CachedNetworkImageProvider(imageUrl!),
                        fit: fit,
                      )
                      : DecorationImage(
                        image: AssetImage(imageUrl ?? ''),
                        fit: fit,
                      )
                  : null,
        ),
        child: child,
      ),
    );
  }
}
