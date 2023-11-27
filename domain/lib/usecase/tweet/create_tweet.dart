import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:appwrite/models.dart';

@injectable
class CreateTweet
    extends FutureUseCase<CreateTweetInput, Either<Failure, Document>> {
  final ITweetRepository tweetRepository;

  CreateTweet(this.tweetRepository);

  @override
  Future<Either<Failure, Document>> buildUseCase(CreateTweetInput input) async {
    var res = await tweetRepository.shareTweet(input.tweet);
    if (res.isLeft()) {
      return Left(res.getLeft().toNullable()!);
    } else {
      return Either.right(res.getRight().toNullable()!);
    }
  }
}

class CreateTweetInput {
  final Tweet tweet;

  CreateTweetInput({required this.tweet});
}
