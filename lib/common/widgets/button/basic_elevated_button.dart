import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

class TBasicElevatedButton extends StatelessWidget {
  const TBasicElevatedButton({
    required this.onPressed,
    this.title = '',
    this.content,
    super.key,
  });

  final String title;
  final Widget? content;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: TSizes.size48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: onPressed,
        child: content ?? Text(title),
      ),
    );
  }
}
