import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

class TRichTextDescription extends StatelessWidget {
  const TRichTextDescription({
    super.key,
    this.onTap,
    this.description,
    required this.text,
  });

  final String text;
  final String? description;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final richText = text.split('*');

    return Column(
      spacing: TSizes.size18,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: richText.isNotEmpty ? richText[0] : null,
            style: Theme.of(context).textTheme.headlineMedium,
            children: <TextSpan>[
              TextSpan(
                text: richText.length > 1 ? richText[1] : null,
                style: Theme.of(
                  context,
                ).textTheme.headlineMedium!.apply(color: TColors.secondary),
                recognizer: TapGestureRecognizer()..onTap = onTap,
              ),
              TextSpan(
                text: richText.length > 2 ? richText[2] : null,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        if (description != null)
          Text(
            description!,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.apply(color: TColors.darkerGrey),
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
      ],
    );
  }
}
