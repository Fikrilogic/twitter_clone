 import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import '../../model/tweet/tweet_model.dart';

// final tweetApiProvider = Provider((ref) {
//   return TweetApi(
//     db: ref.watch(appwriteDatabaseProvider),
//     realtime: ref.watch(appwriteRealtimeProvider),
//   );
// });

abstract class ITweetRepository {
  FutureEither<Document> shareTweet(Tweet tweet);
  Future<List<Document>> getTweet({int? limit, int? offset});
  Stream<RealtimeMessage> getTweetLatest();
}

// @Injectable(as: ITweetRepository)
class TweetRepositoryImpl extends ITweetRepository {
  final Databases _db;
  final Realtime _realtime;

  TweetRepositoryImpl({
    required Databases db,
    required Realtime realtime,
  })  : _db = db,
        _realtime = realtime;

  @override
  FutureEither<Document> shareTweet(Tweet tweet) async {
    try {
      final document = await _db.createDocument(
          databaseId: AppwriteConstants.databaseId,
          collectionId: AppwriteConstants.tweetCollection,
          documentId: ID.unique(),
          data: tweet.toMap());
      return right(document);
    } on AppwriteException catch (e, st) {
      return left(
        Failure(e.message ?? 'Some Unexpected Error', st),
      );
    } catch (e, st) {
      return left(Failure(e.toString(), st));
    }
  }

  @override
  Future<List<Document>> getTweet({int? limit, int? offset}) async {
    final documents = await _db.listDocuments(
      databaseId: AppwriteConstants.databaseId,
      collectionId: AppwriteConstants.tweetCollection,
      queries: [
        Query.orderAsc('tweetedAt'),
      ],
    );
    return documents.documents;
  }

  @override
  Stream<RealtimeMessage> getTweetLatest() {
    return _realtime.subscribe([
      'databases.${AppwriteConstants.databaseId}.collections.${AppwriteConstants.tweetCollection}.documents'
    ]).stream;
  }
}
