import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../common/common.dart';
import '../../../../../core/core.dart';
import '../../../../../data/repositories/repositories.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required AuthenticationRepository authenticationRepository})
    : _authenticationRepository = authenticationRepository,
      super(const SignInState());

  final AuthenticationRepository _authenticationRepository;

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

    try {
      final userCredential = await _authenticationRepository
          .signInWithEmailAndPassword(
            email: state.email,
            password: state.password,
          );

      if (userCredential.user != null) {
        emit(state.copyWith(status: TFormStatus.success));
      } else {
        emit(
          state.copyWith(
            status: TFormStatus.failure,
            errorMessage: TTexts.failedMessage,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(status: TFormStatus.failure, errorMessage: e.toString()),
      );
    }
  }
}
