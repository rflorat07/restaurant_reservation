import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../common/common.dart';

part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit() : super(const CreateAccountState());

  //final AuthenticationRepository _authenticationRepository;

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

  void togglePrivacyPolicy() {
    {
      emit(
        state.copyWith(
          privacyPolicy: !state.privacyPolicy,
          status: TFormStatus.initial,
        ),
      );
    }
  }

  void createAccountSubmitted() async {
    emit(state.copyWith(status: TFormStatus.loading));

    await Future.delayed(const Duration(seconds: 1));

    if (state.name.isNotEmpty) {
      emit(state.copyWith(status: TFormStatus.success));
    } else {
      emit(
        state.copyWith(
          status: TFormStatus.failure,
          errorMessage: 'Something went wrong!',
        ),
      );
    }
  }
}
