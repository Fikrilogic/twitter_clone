part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props  => [];
}

class OnSubmitRegister extends SignupEvent{
  const OnSubmitRegister();
}

class EmailTextFieldChanged extends SignupEvent{
  final String email;

  const EmailTextFieldChanged({required this.email});

  EmailTextFieldChanged copyWith({
    String? email,
  }) {
    return EmailTextFieldChanged(
      email: email ?? this.email,
    );
  }

  @override
  List<Object> get props  => [email];
}

class PasswordTextFieldChanged extends SignupEvent{
  final String password;

  const PasswordTextFieldChanged({required this.password});

  PasswordTextFieldChanged copyWith({
    String? password,
  }) {
    return PasswordTextFieldChanged(
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props  => [password];
}
