part of 'tweet_list_bloc.dart';

abstract class TweetListState extends Equatable {
  const TweetListState();
}

class TweetListInitial extends TweetListState {

  final bool loading;
  final List<TweetDto> tweets;

  const TweetListInitial({this.loading = true, this.tweets = const []});



  @override
  List<Object> get props => [loading, tweets];

  TweetListInitial copyWith({
    bool? loading,
    List<TweetDto>? tweets,
  }) {
    return TweetListInitial(
      loading: loading ?? this.loading,
      tweets: tweets ?? this.tweets,
    );
  }
}
