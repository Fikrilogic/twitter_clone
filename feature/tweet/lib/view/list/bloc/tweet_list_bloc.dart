import 'package:bloc/bloc.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:domain/dto/tweet/tweet_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'tweet_list_event.dart';

part 'tweet_list_state.dart';

@injectable
class TweetListBloc extends Bloc<TweetListEvent, TweetListInitial> {
  final GetTweetStream _getTweetStream;
  final GetTweet _getTweet;

  TweetListBloc(this._getTweetStream, this._getTweet) : super(const TweetListInitial()) {
    on<OnLoadTweetLatest>(_onLoadTweetLatest);
    on<OnLoadTweet>(_onLoadTweet);
  }

  void _onLoadTweetLatest(
      OnLoadTweetLatest event, Emitter<TweetListInitial> emit) {
    _getTweetStream.executed(const GetTweetStreamInput()).listen(
      (data) {
        // print('load data tweet');
        // print(data);
      },
      onError: (error) {
        print(error.toString);
      },
      onDone: () {
        print('stream close');
      },
    );
  }

  void _onLoadTweet(OnLoadTweet event, Emitter<TweetListInitial> emit)async {
    var tweets = await _getTweet.execute(const GetTweetInput());
    emit(
      state.copyWith(tweets: tweets)
    );
  }
}
