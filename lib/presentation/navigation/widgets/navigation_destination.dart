import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/core.dart';

class TNavigationDestination extends StatelessWidget {
  const TNavigationDestination({
    super.key,
    required this.label,
    required this.selectedIcon,
    required this.icon,
    this.iconWidth = TSizes.defaultSpace,
    this.iconHeight = TSizes.defaultSpace,
  });

  final String label;
  final String icon, selectedIcon;
  final double iconWidth, iconHeight;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      selectedIcon: SvgPicture.asset(
        selectedIcon,
        width: iconWidth,
        height: iconHeight,
      ),
      icon: SvgPicture.asset(icon, width: iconWidth, height: iconHeight),
      label: label,
    );
  }
}
