import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/common.dart';
import '../../../../../core/core.dart';
import '../../../../presentation.dart';
import '../cubit/email_verification_cubit.dart';

class EmailVerificationBody extends StatelessWidget {
  const EmailVerificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EmailVerificationCubit, EmailVerificationState>(
      listener: (context, state) {
        if (state is EmailVerificationSuccess) {
          AppNavigator.pushAndRemoveWithoutAnimation(
            context,
            const SignInScreen(),
          );
        }
      },
      child: Column(
        spacing: TSizes.spaceBtwItems,
        children: [
          // Send email info
          Text(
            TTexts.sendEmailInfo,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.labelLarge!.apply(color: TColors.darkerGrey),
          ),

          /// Verify button
          TBasicElevatedButton(
            title: TTexts.ctaContinue,
            onPressed:
                () =>
                    context
                        .read<EmailVerificationCubit>()
                        .checkEmailVerificationStatus(),
          ),

          Text(
            TTexts.verifyEmaiErrorInfo,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.labelLarge!.apply(color: TColors.darkerGrey),
          ),

          // Resend code
          TextButton(
            onPressed:
                () =>
                    context
                        .read<EmailVerificationCubit>()
                        .sendVerificationEmail(),
            child: Text(
              TTexts.resendEmail,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
