part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  const SignInState({
    this.email = '',
    this.password = '',
    this.obscureText = true,
    this.rememberMe = false,
    this.errorMessage = '',
    this.status = TFormStatus.initial,
  });

  final String email;
  final String password;
  final bool obscureText;
  final bool rememberMe;
  final String errorMessage;
  final TFormStatus status;

  @override
  List<Object> get props => [
    email,
    password,
    obscureText,
    rememberMe,
    status,
    errorMessage,
  ];

  SignInState copyWith({
    String? email,
    String? password,
    bool? obscureText,
    bool? rememberMe,
    String? errorMessage,
    TFormStatus? status,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      obscureText: obscureText ?? this.obscureText,
      rememberMe: rememberMe ?? this.rememberMe,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
