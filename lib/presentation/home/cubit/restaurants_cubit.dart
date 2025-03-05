import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repositories/repositories.dart';

part 'restaurants_state.dart';

class RestaurantsCubit extends Cubit<RestaurantsState> {
  RestaurantsCubit({required RestaurantsRepository restaurantsRepository})
    : _restaurantsRepository = restaurantsRepository,
      super(RestaurantsInitial());

  final RestaurantsRepository _restaurantsRepository;

  Future<void> fetchRestaurants(double lat, double lng) async {
    emit(RestaurantsLoading());
    try {
      final restaurants = await _restaurantsRepository.getNearbyRestaurants(
        lat,
        lng,
      );
      emit(RestaurantsLoaded(restaurants));
    } catch (e) {
      emit(const RestaurantsError('Error obteniendo restaurantes'));
    }
  }

  String getPhotoUrl(String? photoReference) {
    return _restaurantsRepository.getPhotoUrl(photoReference);
  }
}
