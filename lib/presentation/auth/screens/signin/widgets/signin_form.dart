import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../../common/common.dart';
import '../../../../../core/core.dart';
import '../../../../../data/repositories/repositories.dart';
import '../../../../presentation.dart';
import '../cubit/sign_in_cubit.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

    return BlocProvider(
      create:
          (context) => SignInCubit(
            authenticationRepository: locator<AuthenticationRepository>(),
          ),
      child: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state.status == TFormStatus.success) {
            AppNavigator.pushReplacement(context, const HomeScreen());
          } else if (state.status == TFormStatus.failure) {
            AppSnackbar.error(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          final signInCubit = context.read<SignInCubit>();
          return Form(
            key: signInFormKey,
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.size54),
              child: Column(
                spacing: TSizes.size20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Email
                  TCustomTextFormField(
                    label: TTexts.email,
                    onChanged: (value) => signInCubit.emailChanged(value),
                    validator: (value) => TValidators.validateEmail(value),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  /// Password
                  TCustomTextFormField(
                    label: TTexts.password,
                    onChanged: (value) => signInCubit.passwordChanged(value),
                    validator: (value) => TValidators.validatePassword(value),
                    obscureText: signInCubit.state.obscureText,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () => signInCubit.togglePasswordVisibility(),
                        icon: Icon(
                          signInCubit.state.obscureText
                              ? IconsaxPlusLinear.eye_slash
                              : IconsaxPlusLinear.eye,
                        ),
                      ),
                    ),
                    onFieldSubmitted: (_) {
                      if (signInFormKey.currentState!.validate()) {
                        signInCubit.signInSubmitted();
                      }
                    },
                  ),

                  /// Remember Me & Forget Password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Remember Me
                      Row(
                        children: [
                          SizedBox(
                            height: TSizes.size24,
                            width: TSizes.size24,
                            child: Checkbox(
                              value: signInCubit.state.rememberMe,
                              onChanged:
                                  (value) => signInCubit.toggleRememberMe(),
                            ),
                          ),
                          const SizedBox(width: TSizes.size4),
                          Text(
                            TTexts.rememberMe,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),

                      /// Forget Password
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          TTexts.forgetPassword,
                          style: Theme.of(
                            context,
                          ).textTheme.labelLarge!.copyWith(
                            color: TColors.primary,
                            fontWeight: FontWeight.w500,
                            decorationColor: TColors.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),

                  /// Sign In button
                  TBasicElevatedButton(
                    onPressed: () {
                      if (signInFormKey.currentState!.validate()) {
                        signInCubit.signInSubmitted();
                      }
                    },
                    title: TTexts.signIn,
                  ),

                  const SizedBox(height: TSizes.size20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
