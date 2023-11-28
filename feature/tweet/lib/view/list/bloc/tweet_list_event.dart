part of 'tweet_list_bloc.dart';

abstract class TweetListEvent extends Equatable {
  const TweetListEvent();
}

class OnLoadTweetLatest extends TweetListEvent {

  const OnLoadTweetLatest();

  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class OnLoadTweet extends TweetListEvent {

  const OnLoadTweet();

  @override
  // TODO: implement props
  List<Object?> get props => [];

}
