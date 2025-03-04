import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/datasources/datasources.dart';
import '../../../data/repositories/repositories.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit({
    required AuthenticationRepository authenticationRepository,
    required SharedPreferencesService? sharedPreferencesService,
  }) : _authenticationRepository = authenticationRepository,
       //_sharedPreferencesService = sharedPreferencesService,
       super(AuthenticationInitial());

  StreamSubscription? _authStateSubscription;
  final AuthenticationRepository _authenticationRepository;
  // final SharedPreferencesService _sharedPreferencesService;

  void checkAuthenticationStatus() {
    _authStateSubscription = _authenticationRepository.authState.listen((user) {
      if (user != null) {
        emit(AuthenticationHome());
      } else {
        emit(AuthenticationSignIn());
      }
    });
  }

  @override
  Future<void> close() {
    _authStateSubscription?.cancel();
    return super.close();
  }
}
