part of 'signin_bloc.dart';

abstract class SigninEvent extends Equatable {
  const SigninEvent();
  @override
  List<Object?> get props => [];
}

class OnSubmitSignin extends SigninEvent{

  const OnSubmitSignin();
}

class EmailTextFieldChange extends SigninEvent{
  final String email;

  const EmailTextFieldChange({required this.email});

  EmailTextFieldChange copyWith({
    String? email,
  }) {
    return EmailTextFieldChange(
      email: email ?? this.email,
    );
  }
}

class PasswordTextFieldChange extends SigninEvent{
  final String password;

  const PasswordTextFieldChange({required this.password});

  PasswordTextFieldChange copyWith({
    String? password,
  }) {
    return PasswordTextFieldChange(
      password: password ?? this.password,
    );
  }
}

class CheckCurrentUser extends SigninEvent{
  const CheckCurrentUser();
}
