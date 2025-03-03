part of 'create_account_cubit.dart';

class CreateAccountState extends Equatable {
  const CreateAccountState({
    this.name = '',
    this.email = '',
    this.password = '',
    this.obscureText = true,
    this.agreeTerms = false,
    this.errorMessage = '',
    this.status = TFormStatus.initial,
  });

  final String name;
  final String email;
  final String password;
  final bool obscureText;
  final bool agreeTerms;
  final String errorMessage;
  final TFormStatus status;

  @override
  List<Object> get props => [
    name,
    email,
    password,
    obscureText,
    agreeTerms,
    status,
    errorMessage,
  ];

  CreateAccountState copyWith({
    String? name,
    String? email,
    String? password,
    bool? obscureText,
    bool? agreeTerms,
    String? errorMessage,
    TFormStatus? status,
  }) {
    return CreateAccountState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      obscureText: obscureText ?? this.obscureText,
      agreeTerms: agreeTerms ?? this.agreeTerms,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
