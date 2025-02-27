import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../../common/common.dart';
import '../../../../../core/core.dart';
import '../cubit/sign_in_cubit.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => SignInCubit(),
      child: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state.status == TFormStatus.success) {
            // AppNavigator.pushReplacement(context, HomeScreen());
          } else if (state.status == TFormStatus.failure) {
            AppSnackbar.show(context, message: state.errorMessage);
          }
        },
        builder: (context, state) {
          final signInCubit = context.read<SignInCubit>();
          return Form(
            key: signInFormKey,
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.size54),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Email
                  Text(
                    TTexts.email,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: TSizes.size6),

                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) => signInCubit.emailChanged(value),
                    validator: (value) => TValidators.validateEmail(value),
                  ),

                  const SizedBox(height: TSizes.size20),

                  /// Password
                  Text(
                    TTexts.password,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: TSizes.size6),

                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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

                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Sign In button
                  TBasicElevatedButton(
                    onPressed: () {
                      if (signInFormKey.currentState!.validate()) {
                        signInCubit.signInSubmitted();
                      }
                    },
                    title: TTexts.signIn,
                  ),

                  const SizedBox(height: TSizes.size44),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
