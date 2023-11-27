part of 'signup_bloc.dart';

abstract class SignupState extends Equatable {
  const SignupState();
}

class SignupInitial extends SignupState {

  final String email;
  final String password;
  final bool loading;
  final bool signupStatus;
  final String message;


  const SignupInitial({
    this.email = '',
    this.password = '',
    this.loading = false,
    this.signupStatus = false,
    this.message = '',
  });

  @override
  List<Object> get props => [email, password, loading, signupStatus, message];

  SignupInitial copyWith({
    String? email,
    String? password,
    bool? loading,
    bool? signupStatus,
    String? message,
  }) {
    return SignupInitial(
      email: email ?? this.email,
      password: password ?? this.password,
      loading: loading ?? this.loading,
      signupStatus: signupStatus ?? this.signupStatus,
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    return 'SignupInitial{email: $email, password: $password, loading: $loading, signupStatus: $signupStatus, failure: $message}';
  }
}
