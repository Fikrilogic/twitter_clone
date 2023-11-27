part of 'tweet_list_bloc.dart';

abstract class TweetListState extends Equatable {
  const TweetListState();
}

class TweetListInitial extends TweetListState {

  final bool loading;
  final List<Tweet> tweets;

  const TweetListInitial({this.loading = true, this.tweets = const []});

  @override
  List<Object> get props => [loading, tweets];
}
