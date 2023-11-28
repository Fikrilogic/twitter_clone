import 'package:core/base/usecase/future_usecase.dart';
import 'package:data/data.dart';
import 'package:domain/dto/tweet/tweet_dto.dart';
import 'package:domain/dto/tweet/tweet_dto_extension.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTweet extends FutureUseCase<GetTweetInput, List<TweetDto>> {
  final ITweetRepository _tweetRepository;
  final IUserRepository _userRepository;

  const GetTweet(this._tweetRepository, this._userRepository);

  @override
  Future<List<TweetDto>> buildUseCase(GetTweetInput input) async {
    var res = await _tweetRepository.getTweet();
    List<TweetDto> tweets = [];

    res.forEach((document) async {
      var tweet = Tweet.fromMap(document.data);
      var user = UserModel.fromMap(
          (await _userRepository.getUserData(tweet.uid)).data);
      var dto = tweet.toDto();
      tweets.add(dto.copyWith(user: user));
    });
    return tweets;
  }
}

class GetTweetInput {
  const GetTweetInput();
}

// class GetTweetOutput{
//   const GetTweetOutput();
// }
