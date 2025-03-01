import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../../common/common.dart';
import '../../../../../core/core.dart';
import '../cubit/email_verification_cubit.dart';
import 'email_verification_body.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmailVerificationCubit()..sendVerificationEmail(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.defaultSpace,
                vertical: TSizes.appBarHeight,
              ),
              child: Column(
                spacing: TSizes.defaultSpace,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Icon
                  const Icon(
                    IconsaxPlusBold.tick_circle,
                    size: TSizes.size120,
                    color: TColors.primary,
                  ),

                  /// Title & Sub-Title
                  TCustomHeader(
                    title: TTexts.verifyEmailTitle,
                    subTitle: TTexts.verifyEmailSubTitle,
                    info: email ?? '',
                  ),

                  /// Verify Email Info
                  const EmailVerificationBody(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
