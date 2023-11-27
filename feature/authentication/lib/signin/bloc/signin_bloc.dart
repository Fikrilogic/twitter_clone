import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

part 'signin_event.dart';
part 'signin_state.dart';

@injectable
class SigninBloc extends Bloc<SigninEvent, SigninInitial> {
  final SignInEmailPassword _signInEmailPassword;
  final CreateTweet _createTweet;

  SigninBloc(this._signInEmailPassword, this._createTweet) : super(const SigninInitial()) {
    on<EmailTextFieldChange>(_onEmailTextFieldChanged);
    on<PasswordTextFieldChange>(_onPasswordTextFieldChanged);
    on<OnSubmitSignin>(_onSubmitSignin);
  }

  void _onEmailTextFieldChanged(
      EmailTextFieldChange event, Emitter<SigninInitial> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordTextFieldChanged(
      PasswordTextFieldChange event, Emitter<SigninInitial> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onSubmitSignin(
      OnSubmitSignin event, Emitter<SigninInitial> emit) async {
    log(state.email);
    try {
      final result = await _signInEmailPassword
          .execute(SignInInput(email: state.email, password: state.password));
      emit(state.copyWith(loginStatus: result.status, message: result.failure?.message));
    } catch (e) {
      emit(state.copyWith(message: e.toString()));
    }
  }
}
