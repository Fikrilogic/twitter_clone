import 'dart:io';

import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/constant/appwrite_constant.dart';
import 'package:twitter_clone/core/core.dart';

abstract class IStorageApi {
  Future<List<String>> createFile(List<File> files);
}

final storageApiProvider = Provider((ref) {
  return StorageApi(storage: ref.watch(appwriteStorageProvider));
});

class StorageApi extends IStorageApi {
  final Storage _storage;

  StorageApi({required Storage storage}) : _storage = storage;

  @override
  Future<List<String>> createFile(List<File> files) async {
    final List<String> filesPath = [];
    for (final file in files) {
      final uploadPath = await _storage.createFile(
        bucketId: AppwriteConstants.bucketId,
        fileId: ID.unique(),
        file: InputFile.fromPath(path: file.path),
      );
      filesPath.add(AppwriteConstants.imageUrl(uploadPath.$id));
    }

    return filesPath;
  }
}
