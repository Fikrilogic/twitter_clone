import 'dart:developer';

import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpEmailPassword extends FutureUseCase<SignupInput, SignupOutput> {
  const SignUpEmailPassword(this._userRepository, this._authRepository);

  final IUserRepository _userRepository;
  final IAuthRepository _authRepository;

  @override
  Future<SignupOutput> buildUseCase(SignupInput input) async {
    final res = await _authRepository.signUp(
        email: input.email, password: input.password);
    log(res.toString());
    final result = res.map((data) async {
      UserModel userModel = UserModel(
          email: input.email,
          name: getNameFromEmail(input.email),
          profilePic: '',
          bannerPic: '',
          uid: data.$id,
          bio: '',
          isTwitterBlue: false,
          followers: const [],
          following: const []);
      final result = await _userRepository.saveUserData(userModel);
      return result.fold((l) => l, (r) => r);
    });
    return SignupOutput(
        status: result.isRight(), failure: result.getLeft().toNullable());
  }
}

class SignupInput {
  const SignupInput({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SignupInput && runtimeType == other.runtimeType);

  @override
  int get hashCode => 0;

  @override
  String toString() {
    return 'SignupInput{' + '}';
  }

  SignupInput copyWith({String? email, String? password}) {
    return SignupInput(
        email: email ?? this.email, password: password ?? this.password);
  }

  Map<String, dynamic> toMap() {
    return {};
  }

  factory SignupInput.fromMap(Map<String, dynamic> map) {
    return SignupInput(
        email: map['email'] ?? '', password: map['password'] ?? '');
  }
}

class SignupOutput {
  const SignupOutput({required this.status, this.failure});

  final bool status;
  final Failure? failure;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SignupOutput && runtimeType == other.runtimeType);

  @override
  int get hashCode => 0;

  @override
  String toString() {
    return 'SignupOutput{' + '}';
  }

  SignupOutput copyWith({bool? status, Failure? failure}) {
    return SignupOutput(
        status: status ?? this.status, failure: failure ?? this.failure);
  }

  Map<String, dynamic> toMap() {
    return {};
  }

  factory SignupOutput.fromMap(Map<String, dynamic> map) {
    return SignupOutput(status: map['status'] ?? '', failure: map['failure']);
  }
}
