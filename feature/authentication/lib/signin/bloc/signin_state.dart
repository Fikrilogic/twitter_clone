part of 'signin_bloc.dart';

abstract class SigninState extends Equatable {
  const SigninState();
}

class SigninInitial extends SigninState {
  final String email;
  final String password;
  final bool loading;
  final String message;
  final bool loginStatus;

  const SigninInitial({
    this.email = '',
    this.password = '',
    this.loading = false,
    this.message = '',
    this.loginStatus = false
  });

  SigninInitial copyWith({
    String? email,
    String? password,
    bool? loading,
    String? message,
    bool? loginStatus,
  }) {
    return SigninInitial(
      email: email ?? this.email,
      password: password ?? this.password,
      loading: loading ?? this.loading,
      message: message ?? this.message,
      loginStatus: loginStatus ?? this.loginStatus
    );
  }

  @override
  List<Object> get props => [email, password, loading, message, loginStatus];


}
