import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../../common/common.dart';
import '../../../../../core/core.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    return Form(
      key: loginFormKey,
      child: Padding(
        padding: const EdgeInsets.only(top: TSizes.size54),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Email
            Text(
              TTexts.email,
              style: Theme.of(
                context,
              ).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: TSizes.size6),

            SizedBox(
              height: TSizes.size44,
              child: TextFormField(
                controller: email,
                validator: (value) => TValidators.validateEmail(value),
              ),
            ),

            const SizedBox(height: TSizes.size20),

            /// Password
            Text(
              TTexts.password,
              style: Theme.of(
                context,
              ).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: TSizes.size6),

            SizedBox(
              height: TSizes.size44,
              child: TextFormField(
                controller: password,
                validator: (value) => TValidators.validatePassword(value),
                obscureText: true,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      true
                          ? IconsaxPlusLinear.eye_slash
                          : IconsaxPlusLinear.eye,
                    ),
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
                      child: Checkbox(value: false, onChanged: (value) {}),
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
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
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
            TBasicElevatedButton(onPressed: () {}, title: TTexts.signIn),

            const SizedBox(height: TSizes.size44),
          ],
        ),
      ),
    );
  }
}
