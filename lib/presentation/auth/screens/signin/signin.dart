import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../common/common.dart';
import '../../../../core/core.dart';
import 'widgets/signin_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /// Title & Sub-Title
              const TCustomHeader(
                title: TTexts.signInTitle,
                subTitle: TTexts.signInSubTitle,
              ),

              /// Sign In Form
              const SignInForm(),

              /// Divider
              const TFormDivider(dividerText: TTexts.signInWith),

              /// Social Buttons
              const TSocialButtons(),

              TRichTextTap(
                text: TTexts.signInAccount,
                fontSize: TSizes.fontSize12,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
