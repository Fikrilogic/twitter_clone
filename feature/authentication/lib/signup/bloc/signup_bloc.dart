import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'signup_event.dart';

part 'signup_state.dart';

@injectable
class SignupBloc extends Bloc<SignupEvent, SignupInitial> {
  final SignUpEmailPassword signUpEmailPassword;

  SignupBloc(this.signUpEmailPassword) : super(const SignupInitial()) {
    on<OnSubmitRegister>(_onSubmitRegister);
    on<EmailTextFieldChanged>(_onEmailTextFieldChange);
    on<PasswordTextFieldChanged>(_onPasswordTextFieldChange);
  }

  void _onSubmitRegister(
      OnSubmitRegister event, Emitter<SignupInitial> emit) async {
    try {
      log('${state.email}  ${state.password}');
      var res = await signUpEmailPassword
          .execute(SignupInput(email: state.email, password: state.password));
      emit(state.copyWith(message: res.failure?.message??'', signupStatus: res.status));
      log(state.toString());
    } catch (e, st) {
      log(e.toString());
      addError(e, st);
      emit(state.copyWith(
          message: e.toString(), signupStatus: false));
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  void _onEmailTextFieldChange(
      EmailTextFieldChanged event, Emitter<SignupInitial> emit) {
    log(event.email);
    try {
      var updateState = state.copyWith(email: event.email);
      log(updateState.toString());
      emit(updateState);
      log(state.toString());
    } catch (e, st) {
      log(e.toString(), stackTrace: st);
    }
  }

  void _onPasswordTextFieldChange(
      PasswordTextFieldChanged event, Emitter<SignupInitial> emit) {
    log(event.password);
    try {
      emit(state.copyWith(password: event.password));
      log(state.toString());
    } catch (e, st) {
      log(e.toString(), stackTrace: st);
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print(error);
    super.onError(error, stackTrace);
  }

  @override
  void onChange(Change<SignupInitial> change) {
    // TODO: implement onChange
    print('$change');
    super.onChange(change);
  }
}
