import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:fpdart/fpdart.dart';
import 'package:core/core.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

// final authApiProvider = Provider((ref) {
//   return AuthApiImpl(account: ref.watch(appwriteAccountProvider));
// });

abstract class IAuthRepository {
  FutureEither<model.User> signUp(
      {required String email, required String password});

  FutureEither<model.Session> login(
      {required String email, required String password});

  Future<model.User?> checkCurrentUser();
}

// @Injectable(as: IAuthRepository)
class AuthRepositoryImpl implements IAuthRepository {
  final Account _account;

  AuthRepositoryImpl({required Account account}) : _account = account;

  @override
  FutureEither<model.User> signUp(
      {required String email, required String password}) async {
    try {
      log('error');
      log(_account.toString());
      final account = await _account.create(
          userId: ID.unique(), email: email, password: password);
      return Right(account);
    } on AppwriteException catch (e, stackTrace) {
      log(e.message??'error appwrite', stackTrace: stackTrace);
      return Either.left(
          Failure(e.message ?? "Something Error Occurs", stackTrace));
    } catch (e, stackTrace) {
      log(e.toString());
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
