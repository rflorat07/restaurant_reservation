import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

class TRichTextTap extends StatelessWidget {
  const TRichTextTap({
    super.key,
    required this.text,
    required this.onTap,
    this.fontSize = TSizes.fontSize16,
  });

  final String text;
  final double? fontSize;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final richText = text.split('*');

    final TextStyle style = TextStyle(
      color: TColors.primary,
      decoration: TextDecoration.underline,
      decorationColor: TColors.primary,
      fontWeight: FontWeight.w500,
      fontSize: fontSize,
    );

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: richText.isNotEmpty ? richText[0] : null,
        style: Theme.of(
          context,
        ).textTheme.titleSmall!.copyWith(fontSize: fontSize),
        children: <TextSpan>[
          TextSpan(
            text: richText.length > 1 ? richText[1] : null,
            style: style,
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
