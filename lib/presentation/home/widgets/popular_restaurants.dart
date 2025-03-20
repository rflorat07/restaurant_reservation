import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/common.dart';
import '../../../core/core.dart';
import '../../location/cubit/location_cubit.dart';
import '../cubit/restaurants/restaurants_cubit.dart';

class TPopularRestaurants extends StatelessWidget {
  const TPopularRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, locationState) {
        if (locationState is LocationLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (locationState is LocationError) {
          return Center(child: Text('Error: ${locationState.message}'));
        } else if (locationState is LocationLoaded) {
          context.read<RestaurantsCubit>().fetchRestaurants(
            locationState.position.latitude,
            locationState.position.longitude,
          );
          return BlocBuilder<RestaurantsCubit, RestaurantsState>(
            builder: (context, restaurantState) {
              if (restaurantState is RestaurantsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (restaurantState is RestaurantsError) {
                return Center(child: Text('Error: ${restaurantState.message}'));
              } else if (restaurantState is RestaurantsLoaded) {
                return Column(
                  children: [
                    /// Section Heading - Popular Restaurants
                    TSectionHeading(
                      title: TTexts.popularRestaurants,
                      horizontal: TSizes.defaultSpace,
                      onPressed: () {},
                    ),

                    Padding(
                      padding: const EdgeInsets.all(TSizes.defaultSpace),
                      child: ListView.separated(
                        itemCount: restaurantState.restaurants.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final restaurant = restaurantState.restaurants[index];

                          return TCardRestaurant(restaurant: restaurant);
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: TSizes.size12);
                        },
                      ),
                    ),
                  ],
                );
              }
              return const Center(
                child: Text('No se encontraron restaurantes'),
              );
            },
          );
        }
        return const Center(child: Text('Obteniendo ubicación...'));
      },
    );
  }
}
