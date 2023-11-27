import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import '../../model/user/user_model.dart';

// final userApiProvider = Provider((ref) {
//   return UserApi(db: ref.watch(appwriteDatabaseProvider));
// });

abstract class IUserRepository {
  FutureEitherVoid saveUserData(UserModel userModel);

  Future<Document> getUserData(String uid);


}

// @Injectable(as: IUserRepository)
class UserRepositoryImpl implements IUserRepository {
  final Databases _db;

  const UserRepositoryImpl({
    required Databases db,
  }) : _db = db;

  @override
  FutureEitherVoid saveUserData(UserModel userModel) async {
    print(userModel.uid);
    try {
      await _db.createDocument(
          databaseId: AppwriteConstants.databaseId,
          collectionId: AppwriteConstants.userCollection,
          documentId: userModel.uid,
          data: userModel.toMap());
      return Either.right(null);
    } on AppwriteException catch (e, st) {
      return Either.left(Failure(e.message ?? 'Something Error Occur', st));
    } catch (e, st) {
      return Either.left(Failure(e.toString(), st));
    }
  }

  @override
  Future<Document> getUserData(String uid) {
    print('uid $uid get user');
    final res = _db.getDocument(
      databaseId: AppwriteConstants.databaseId,
      collectionId: AppwriteConstants.userCollection,
      documentId: uid.trim(),
    );
    print('response $res');
    return res;
  }
}
