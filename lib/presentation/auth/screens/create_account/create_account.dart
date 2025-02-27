import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../common/common.dart';
import '../../../../core/core.dart';
import '../signin/signin.dart';
import 'widgets/create_account_form.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: TSpacingStyle.paddingWithAppBarHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                /// Title & Sub-Title
                const TCustomHeader(
                  title: TTexts.createAccountTitle,
                  subTitle: TTexts.createAccountSubTitle,
                ),

                /// Create Account Form
                const CreateAccountForm(),

                /// Divider
                const TFormDivider(
                  dividerText: TTexts.signUpWith,
                  padding: EdgeInsets.only(top: TSizes.size44),
                ),

                /// Social Buttons
                const TSocialButtons(),

                TRichTextTap(
                  text: TTexts.createAccountSignIn,
                  fontSize: TSizes.fontSize12,
                  onTap:
                      () => AppNavigator.pushAndRemoveWithoutAnimation(
                        context,
                        const SignInScreen(),
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
