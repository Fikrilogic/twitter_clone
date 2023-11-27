import 'dart:io';

import 'package:appwrite/appwrite.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:core/core.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

abstract class IStorageRepository {
  FutureEither<List<String>>  createFile(List<File> files);
}
//
// final storageApiProvider = Provider((ref) {
//   return StorageApi(storage: ref.watch(appwriteStorageProvider));
// });

// @Injectable(as: IStorageRepository)
class StorageRepositoryImpl extends IStorageRepository {
  final Storage _storage;

  StorageRepositoryImpl({required Storage storage}) : _storage = storage;

  @override
  FutureEither<List<String>> createFile(List<File> files) async {
    try {
      final List<String> filesPath = [];
      for (final file in files) {
        final uploadPath = await _storage.createFile(
          bucketId: AppwriteConstants.bucketId,
          fileId: ID.unique(),
          file: InputFile.fromPath(path: file.path),
        );
        filesPath.add(AppwriteConstants.imageUrl(uploadPath.$id));
      }

      return Right(filesPath);
    } on AppwriteException catch(e,st){
      return Left(Failure(e.message??'Something Happen Occurs', st));
    } catch(e, st){
      return Left(Failure(e.toString(), st));
    }
  }
}
