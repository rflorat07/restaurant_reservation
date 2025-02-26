part of 'authentication_cubit.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationLoading extends AuthenticationState {}

final class AuthenticationWelcome extends AuthenticationState {}

final class AuthenticationSignIn extends AuthenticationState {}

final class AuthenticationHome extends AuthenticationState {}
