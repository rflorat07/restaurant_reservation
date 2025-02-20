import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

class TRichTextTap extends StatelessWidget {
  const TRichTextTap({super.key, required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final richText = text.split('*');

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: richText.isNotEmpty ? richText[0] : null,
        style: Theme.of(context).textTheme.titleSmall,
        children: <TextSpan>[
          TextSpan(
            text: richText.length > 1 ? richText[1] : null,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: TColors.secondary,
              decoration: TextDecoration.underline,
              decorationColor: TColors.secondary,
              fontWeight: FontWeight.w500,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
