import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

class TBasicElevatedButton extends StatelessWidget {
  const TBasicElevatedButton({
    required this.onPressed,
    super.key,
    this.content,
    this.margin,
    this.title = '',
  });

  final String title;
  final Widget? content;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: TSizes.size48,
      margin: margin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: onPressed,
        child: content ?? Text(title),
      ),
    );
  }
}
