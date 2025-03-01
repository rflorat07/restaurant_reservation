part of 'email_verification_cubit.dart';

sealed class EmailVerificationState extends Equatable {
  const EmailVerificationState();

  @override
  List<Object> get props => [];
}

final class EmailVerificationInitial extends EmailVerificationState {}

final class EmailVerificationLoading extends EmailVerificationState {}

final class EmailVerificationSent extends EmailVerificationState {}

final class EmailVerificationSuccess extends EmailVerificationState {}

final class EmailVerificationError extends EmailVerificationState {
  const EmailVerificationError(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}
