part of 'create_account_cubit.dart';

class CreateAccountState extends Equatable {
  const CreateAccountState({
    this.name = '',
    this.email = '',
    this.password = '',
    this.obscureText = true,
    this.privacyPolicy = false,
    this.errorMessage = '',
    this.status = TFormStatus.initial,
  });

  final String name;
  final String email;
  final String password;
  final bool obscureText;
  final bool privacyPolicy;
  final String errorMessage;
  final TFormStatus status;

  @override
  List<Object> get props => [
    name,
    email,
    password,
    obscureText,
    privacyPolicy,
    status,
    errorMessage,
  ];

  CreateAccountState copyWith({
    String? name,
    String? email,
    String? password,
    bool? obscureText,
    bool? privacyPolicy,
    String? errorMessage,
    TFormStatus? status,
  }) {
    return CreateAccountState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      obscureText: obscureText ?? this.obscureText,
      privacyPolicy: privacyPolicy ?? this.privacyPolicy,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
