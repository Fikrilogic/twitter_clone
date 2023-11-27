import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInEmailPassword extends FutureUseCase<SignInInput, SignInOutput> {

  final IAuthRepository _authRepository;
  SignInEmailPassword(this._authRepository);

  @override
  Future<SignInOutput> buildUseCase(SignInInput input) async {
    final res = await _authRepository.login(
        email: input.email, password: input.password.trim());

    return SignInOutput(
        status: res.isRight(), failure: res.getLeft().toNullable());
  }
}

class SignInInput {
  const SignInInput({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SignInInput && runtimeType == other.runtimeType);

  @override
  int get hashCode => 0;

  @override
  String toString() {
    return 'SignInInput{' + '}';
  }

  SignInInput copyWith({String? email, String? password}) {
    return SignInInput(
        email: email ?? this.email, password: password ?? this.password);
  }

  Map<String, dynamic> toMap() {
    return {};
  }

  factory SignInInput.fromMap(Map<String, dynamic> map) {
    return SignInInput(
        email: map['email'] ?? '', password: map['password'] ?? '');
  }
}

class SignInOutput {
  const SignInOutput({required this.status, this.failure});

  final bool status;
  final Failure? failure;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SignInOutput && runtimeType == other.runtimeType);

  @override
  int get hashCode => 0;

  @override
  String toString() {
    return 'SignInOutput{' + ' ${this.status}' + ' ${this.failure}';
  }

  SignInOutput copyWith({bool? status, Failure? failure}) {
    return SignInOutput(
        status: status ?? this.status, failure: failure ?? this.failure);
  }

  Map<String, dynamic> toMap() {
    return {};
  }

  factory SignInOutput.fromMap(Map<String, dynamic> map) {
    return SignInOutput(status: map['status'] ?? '', failure: map['failure']);
  }
}
