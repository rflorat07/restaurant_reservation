import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'email_verification_state.dart';

class EmailVerificationCubit extends Cubit<EmailVerificationState> {
  EmailVerificationCubit() : super(EmailVerificationInitial()) {
    listenForEmailVerification();
  }

  StreamSubscription? _emailVerificationSubscription;

  /// Send Email verification Link
  Future<void> sendVerificationEmail() async {
    emit(EmailVerificationLoading());
    /* try {
      //final user = FirebaseAuth.instance.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        emit(EmailVerificationSent());
      } else if (user != null && user.emailVerified) {
        emit(EmailVerificationSuccess());
      } else {
        emit(const EmailVerificationError('Usuario no encontrado'));
      }
    } catch (e) {
      emit(EmailVerificationError(e.toString()));
    } */
  }

  Future<void> checkEmailVerificationStatus() async {
    emit(EmailVerificationLoading());
    await Future.delayed(const Duration(seconds: 1));
    emit(EmailVerificationSuccess());
  }

  void listenForEmailVerification() {
    /* _emailVerificationSubscription = FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null && user.emailVerified) {
        // Email is verified, navigate to the login screen
        emit(EmailVerificationSuccess());
      }
    }); */
  }

  @override
  Future<void> close() {
    _emailVerificationSubscription?.cancel();
    return super.close();
  }
}
