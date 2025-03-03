import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../common/common.dart';
import '../../../../../core/core.dart';
import '../../../../../data/repositories/authentication.repository.dart';

part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository,
       super(const CreateAccountState());

  final AuthenticationRepository _authenticationRepository;

  void nameChanged(String value) {
    emit(state.copyWith(name: value, status: TFormStatus.initial));
  }

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

  void toggleAgreeTerms() {
    {
      emit(
        state.copyWith(
          agreeTerms: !state.agreeTerms,
          status: TFormStatus.initial,
        ),
      );
    }
  }

  void createAccountSubmitted() async {
    emit(state.copyWith(status: TFormStatus.loading));

    if (!state.agreeTerms) {
      emit(
        state.copyWith(
          status: TFormStatus.failure,
          errorMessage: TTexts.acceptAgreeTermsErrorMessage,
        ),
      );
      return;
    }

    try {
      final userCredential = await _authenticationRepository
          .registerWithEmailAndPassword(state.email, state.password);

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
