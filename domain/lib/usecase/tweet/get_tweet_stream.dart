import 'package:appwrite/appwrite.dart';
import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTweetStream extends StreamUseCase<GetTweetStreamInput, RealtimeMessage>{

  final ITweetRepository _tweetRepository;

  const GetTweetStream(this._tweetRepository);

  @override
  Stream<RealtimeMessage> buildUseCase(GetTweetStreamInput input) {
    return _tweetRepository.getTweetLatest();
  }


}

class GetTweetStreamInput{
  const GetTweetStreamInput();
}