import 'dart:io';

import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:appwrite/models.dart' as models;

@injectable
class CreateTweetWithImage extends FutureUseCase<CreateTweetWithImageInput,
    Either<Failure, models.Document>> {
  final ITweetRepository tweetRepository;
  final IStorageRepository storageRepository;

  CreateTweetWithImage(this.tweetRepository, this.storageRepository);

  @override
  Future<Either<Failure, models.Document>> buildUseCase(
      CreateTweetWithImageInput input) async {
    try {
      var imagesLink = await storageRepository.createFile(input.images);

      if (imagesLink.isLeft()) return Left(imagesLink.getLeft().toNullable()!);
      var data =
          input.tweet.copyWith(imageLinks: imagesLink.getRight().toNullable());
      var res = await tweetRepository.shareTweet(data);
      if (res.isLeft()) {
        return Left(res.getLeft().toNullable()!);
      } else {
        return Either.right(res.getRight().toNullable()!);
      }
    } catch (e, st) {
      return Left(Failure(e.toString(), st));
    }
  }
}

class CreateTweetWithImageInput {
  final Tweet tweet;
  final List<File> images;

  CreateTweetWithImageInput({required this.tweet, required this.images});
}
