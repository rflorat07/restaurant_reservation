import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../data/repositories/repositories.dart';

part 'email_verification_state.dart';

class EmailVerificationCubit extends Cubit<EmailVerificationState> {
  EmailVerificationCubit({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository,
       super(EmailVerificationInitial()) {
    listenForEmailVerification();
  }

  StreamSubscription? _authStateSubscription;
  final AuthenticationRepository _authenticationRepository;

  /// Send Email verification Link
  Future<void> sendVerificationEmail() async {
    emit(EmailVerificationLoading());
    try {
      await _authenticationRepository.sendEmailVerification();
      emit(EmailVerificationSent());
    } catch (e) {
      emit(EmailVerificationError(e.toString()));
    }
  }

  void listenForEmailVerification() {
    _authStateSubscription = _authenticationRepository.authState.listen((user) {
      if (user != null && user.emailVerified) {
        emit(EmailVerificationSuccess());
      }
    });
  }

  @override
  Future<void> close() {
    _authStateSubscription?.cancel();
    return super.close();
  }
}
