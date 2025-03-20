import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/sizes.dart';
import '../../presentation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Restaurantes Cercanos')),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: BlocBuilder<LocationCubit, LocationState>(
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
                    return Center(
                      child: Text('Error: ${restaurantState.message}'),
                    );
                  } else if (restaurantState is RestaurantsLoaded) {
                    return ListView.builder(
                      itemCount: restaurantState.restaurants.length,
                      itemBuilder: (context, index) {
                        final restaurant = restaurantState.restaurants[index];
                        // Obtener la URL de la imagen
                        // Obtener la URL de la imagen
                        String? photoReference =
                            restaurant.photos[0].photoReference;
                        String photoRestaurantUrl = context
                            .read<RestaurantsCubit>()
                            .getPhotoUrl(photoReference);

                        return Card(
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            leading: Image.network(
                              photoRestaurantUrl,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            title: Text(restaurant.name),
                            subtitle: Text(restaurant.vicinity),
                          ),
                        );
                      },
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
        ),
      ),
    );
  }
}
