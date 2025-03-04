import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

import '../../../data/repositories/repositories.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit({required LocationRepository locationRepository})
    : _locationRepository = locationRepository,
      super(LocationInitial());

  final LocationRepository _locationRepository;

  Future<void> fetchLocation() async {
    emit(LocationLoading());
    try {
      final position = await _locationRepository.getCurrentLocation();
      emit(LocationLoaded(position as Position));
    } catch (e) {
      emit(const LocationError('Error obteniendo ubicación'));
    }
  }
}
