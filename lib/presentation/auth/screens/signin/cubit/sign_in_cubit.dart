import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(const SignInState());

  //final AuthenticationRepository _authenticationRepository;

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: FormSubmissionStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: FormSubmissionStatus.initial));
  }

  void togglePasswordVisibility() {
    emit(
      state.copyWith(
        obscureText: !state.obscureText,
        status: FormSubmissionStatus.initial,
      ),
    );
  }

  void toggleRememberMe() {
    emit(
      state.copyWith(
        rememberMe: !state.rememberMe,
        status: FormSubmissionStatus.initial,
      ),
    );
  }

  signInSubmitted() async {
    emit(state.copyWith(status: FormSubmissionStatus.loading));

    await Future.delayed(const Duration(seconds: 2));

    if (state.email == 'utente' && state.password == 'password') {
      emit(state.copyWith(status: FormSubmissionStatus.success));
    } else {
      emit(
        state.copyWith(
          status: FormSubmissionStatus.failure,
          errorMessage: 'Login fallito',
        ),
      );
    }
  }
}
