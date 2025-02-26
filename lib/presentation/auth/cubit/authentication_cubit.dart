import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/datasources/datasources.dart';
import '../../../data/repositories/repositories.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit({
    required AuthenticationRepository authenticationRepository,
    required SharedPreferencesService sharedPreferencesService,
  }) : _authenticationRepository = authenticationRepository,
       _sharedPreferencesService = sharedPreferencesService,
       super(AuthenticationInitial());

  final AuthenticationRepository _authenticationRepository;
  final SharedPreferencesService _sharedPreferencesService;

  Future<void> checkStatus() async {
    emit(AuthenticationLoading());

    final currentUser = await _authenticationRepository.currentUser;

    if (currentUser != null) {
      emit(AuthenticationHome());
    } else {
      emit(AuthenticationWelcome());
    }
  }
}
