import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../../common/common.dart';
import '../../../../../core/core.dart';
import '../../email_verification/widgets/email_verification.dart';
import '../cubit/create_account_cubit.dart';
import 'terms_conditions_checkbox.dart';

class CreateAccountForm extends StatelessWidget {
  const CreateAccountForm({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => CreateAccountCubit(),
      child: BlocConsumer<CreateAccountCubit, CreateAccountState>(
        listener: (context, state) {
          if (state.status == TFormStatus.success) {
            AppNavigator.pushReplacement(
              context,
              VerifyEmailScreen(email: state.email),
            );
          } else if (state.status == TFormStatus.failure) {
            AppSnackbar.show(context, message: state.errorMessage);
          }
        },
        builder: (context, state) {
          final createAccountCubit = context.read<CreateAccountCubit>();
          return Form(
            key: signInFormKey,
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.defaultSpace),
              child: Column(
                spacing: TSizes.size20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Name
                  TCustomTextFormField(
                    label: TTexts.name,
                    onChanged: (value) => createAccountCubit.nameChanged(value),
                    validator:
                        (value) =>
                            TValidators.validateEmptyText(TTexts.name, value),
                    textInputAction: TextInputAction.next,
                  ),

                  /// Email
                  TCustomTextFormField(
                    label: TTexts.email,
                    onChanged:
                        (value) => createAccountCubit.emailChanged(value),
                    validator: (value) => TValidators.validateEmail(value),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  /// Password
                  TCustomTextFormField(
                    label: TTexts.password,
                    onChanged:
                        (value) => createAccountCubit.passwordChanged(value),
                    validator: (value) => TValidators.validatePassword(value),
                    obscureText: createAccountCubit.state.obscureText,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed:
                            () => createAccountCubit.togglePasswordVisibility(),
                        icon: Icon(
                          createAccountCubit.state.obscureText
                              ? IconsaxPlusLinear.eye_slash
                              : IconsaxPlusLinear.eye,
                        ),
                      ),
                    ),
                    onFieldSubmitted: (_) {
                      if (signInFormKey.currentState!.validate()) {
                        createAccountCubit.createAccountSubmitted();
                      }
                    },
                  ),

                  /// Agree with Terms & Condition
                  TTermsAndConditionsCheckbox(
                    value: createAccountCubit.state.privacyPolicy,
                    onChanged:
                        (value) => createAccountCubit.togglePrivacyPolicy(),
                  ),

                  /// Sign In button
                  TBasicElevatedButton(
                    margin: const EdgeInsets.only(top: TSizes.size12),
                    onPressed: () {
                      if (signInFormKey.currentState!.validate()) {
                        createAccountCubit.createAccountSubmitted();
                      }
                    },
                    title: TTexts.signUp,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
