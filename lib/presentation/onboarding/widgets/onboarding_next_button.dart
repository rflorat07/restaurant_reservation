import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../cubit/onboarding_cubit.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.read<OnboardingCubit>().nextPage(),
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: EdgeInsets.zero,
        fixedSize: const Size(TSizes.size48, TSizes.size48),
        backgroundColor: TColors.primary,
      ),
      child: const Icon(Icons.arrow_forward, color: TColors.white),
    );
  }
}
