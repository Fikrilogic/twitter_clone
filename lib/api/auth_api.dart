import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authApiProvider = Provider((ref) {
  return AuthApiImpl(account: ref.watch(appwriteAccountProvider));
});

abstract class IAuthApi {
  FutureEither<model.User> signUp(
      {required String email, required String password});

  FutureEither<model.Session> login(
      {required String email, required String password});

  Future<model.User?> checkCurrentUser();
}

class AuthApiImpl implements IAuthApi {
  final Account _account;

  AuthApiImpl({required Account account}) : _account = account;

  @override
  FutureEither<model.User> signUp(
      {required String email, required String password}) async {
    try {
      final account = await _account.create(
          userId: ID.unique(), email: email, password: password);
      return Right(account);
    } on AppwriteException catch (e, stackTrace) {
      return Either.left(
          Failure(e.message ?? "Something Error Occurs", stackTrace));
    } catch (e, stackTrace) {
      return Either.left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  FutureEither<model.Session> login(
      {required String email, required String password}) async {
    try {
      final session =
          await _account.createEmailSession(email: email, password: password);
      return Right(session);
    } on AppwriteException catch (e, stackTrace) {
      return Either.left(
          Failure(e.message ?? "Something Error Occurs", stackTrace));
    } catch (e, stackTrace) {
      return Either.left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<model.User?> checkCurrentUser() async {
    try {
      return await _account.get();
    } on AppwriteException {
      return null;
    } catch (e) {
      return null;
    }
  }
}
