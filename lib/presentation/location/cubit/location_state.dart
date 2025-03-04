part of 'location_cubit.dart';

sealed class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

final class LocationInitial extends LocationState {}

final class LocationLoading extends LocationState {}

final class LocationLoaded extends LocationState {
  const LocationLoaded(this.position);
  final Position position;

  @override
  List<Object> get props => [position];
}

final class LocationError extends LocationState {
  const LocationError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
