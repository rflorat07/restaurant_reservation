import 'package:flutter/material.dart';

import '../../../common/common.dart';
import '../../../core/constants/constants.dart';
import '../../../core/helpers/helpers.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        spacing: TSizes.defaultSpace,
        children: [
          Image.asset(
            fit: BoxFit.cover,
            TImages.welcome,
            width: double.infinity,
            height: THelperFunctions.screenHeight(context) * 0.55,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.size24),
            child: Column(
              spacing: TSizes.defaultSpace,
              children: [
                TRichTextDescription(
                  text: TTexts.welcomeTitle,
                  description: TTexts.welcomeSubTitle,
                ),
                TBasicElevatedButton(
                  title: TTexts.welcomeButton,
                  onPressed: () {},
                ),
                TRichTextTap(text: TTexts.welcomeSignIn, onTap: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
