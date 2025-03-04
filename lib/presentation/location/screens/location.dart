import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/common.dart';
import '../../../core/core.dart';
import '../cubit/location_cubit.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationCubit, LocationState>(
      listener: (context, state) {
        if (state is LocationLoaded) {
          //AppNavigator.pop(context, result: state.position);
        } else if (state is LocationError) {
          AppSnackbar.error(context, state.message);
        }
      },
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              spacing: TSizes.size36,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  fit: BoxFit.cover,
                  TImages.location,
                  width: TSizes.size118,
                  height: TSizes.size118,
                ),
                Column(
                  spacing: TSizes.size16,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      TTexts.locationTitle,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      TTexts.locationSubTitle,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: TColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                TBasicElevatedButton(
                  title: TTexts.locationButton,
                  onPressed: () {
                    context.read<LocationCubit>().fetchLocation();
                  },
                ),

                TextButton(
                  onPressed: () {},
                  child: Text(
                    TTexts.locationManualButton,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: TColors.textPrimary,
                    ),
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
