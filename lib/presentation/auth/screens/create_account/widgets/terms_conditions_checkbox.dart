import 'package:flutter/material.dart';

import '../../../../../common/common.dart';
import '../../../../../core/core.dart';
import '../../signin/signin.dart';

class TTermsAndConditionsCheckbox extends StatelessWidget {
  const TTermsAndConditionsCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: TSizes.size4,
      children: [
        SizedBox(
          width: TSizes.size24,
          height: TSizes.size24,
          child: Checkbox(value: value, onChanged: onChanged),
        ),

        TRichTextTap(
          text: TTexts.createAccountAgreeTerms,
          fontSize: TSizes.fontSize14,
          onTap:
              () => AppNavigator.pushAndRemoveWithoutAnimation(
                context,
                const SignInScreen(),
              ),
        ),
      ],
    );
  }
}
