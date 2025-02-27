import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../common/common.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(const SignInState());

  //final AuthenticationRepository _authenticationRepository;

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: TFormStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: TFormStatus.initial));
  }

  void togglePasswordVisibility() {
    emit(
      state.copyWith(
        obscureText: !state.obscureText,
        status: TFormStatus.initial,
      ),
    );
  }

  void toggleRememberMe() {
    emit(
      state.copyWith(
        rememberMe: !state.rememberMe,
        status: TFormStatus.initial,
      ),
    );
  }

  signInSubmitted() async {
    emit(state.copyWith(status: TFormStatus.loading));

    await Future.delayed(const Duration(seconds: 2));

    if (state.email == 'utente' && state.password == 'password') {
      emit(state.copyWith(status: TFormStatus.success));
    } else {
      emit(
        state.copyWith(
          status: TFormStatus.failure,
          errorMessage: 'Login fallito',
        ),
      );
    }
  }
}
