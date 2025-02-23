import 'package:flutter/material.dart';

import '../../../common/widgets/text/rich_text_description.dart';
import '../../../core/core.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          fit: BoxFit.contain,
          width: THelperFunctions.screenWidth(context) * 0.8,
          height: THelperFunctions.screenHeight(context) * 0.45,
        ),
        Expanded(
          child: Container(
            color: TColors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: TSizes.defaultSpace,
              vertical: TSizes.spaceBtwSections,
            ),
            child: TRichTextDescription(text: title, description: description),
          ),
        ),
      ],
    );
  }
}
