part of 'restaurants_cubit.dart';

sealed class RestaurantsState extends Equatable {
  const RestaurantsState();

  @override
  List<Object> get props => [];
}

final class RestaurantsInitial extends RestaurantsState {}

final class RestaurantsLoading extends RestaurantsState {}

final class RestaurantsLoaded extends RestaurantsState {
  const RestaurantsLoaded(this.restaurants);
  final List<dynamic> restaurants;

  @override
  List<Object> get props => [restaurants];
}

final class RestaurantsError extends RestaurantsState {
  const RestaurantsError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
