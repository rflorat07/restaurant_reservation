import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../core/core.dart';
import '../cubit/onboarding_cubit.dart';

class OnBoardingBackButton extends StatelessWidget {
  const OnBoardingBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder:
          (context, state) =>
              state.currentPageIndex == 0
                  ? const SizedBox(width: TSizes.size64, height: TSizes.size48)
                  : ElevatedButton(
                    onPressed: () => context.read<OnboardingCubit>().backPage(),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: const CircleBorder(),
                      fixedSize: const Size(TSizes.size48, TSizes.size48),
                      backgroundColor: TColors.white,
                    ),
                    child: const Icon(
                      IconsaxPlusLinear.arrow_left,
                      color: TColors.primary,
                    ),
                  ),
    );
  }
}
