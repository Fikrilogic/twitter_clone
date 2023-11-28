import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tweet/view/list/bloc/tweet_list_bloc.dart';
import 'package:tweet/view/widget/tweet_card.dart';

class TweetList extends StatefulWidget {
  const TweetList({super.key});

  @override
  State<TweetList> createState() => _TweetListState();
}

class _TweetListState extends State<TweetList> {
  final TweetListBloc _tweetListBloc = getIt.get();

  @override
  void initState() {
    _tweetListBloc.add(const OnLoadTweet());
    _tweetListBloc.add(const OnLoadTweetLatest());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TweetListBloc>.value(
      value: _tweetListBloc,
      child: BlocBuilder<TweetListBloc, TweetListInitial>(
        builder: (context, state) => ListView.builder(
          itemCount: state.tweets.length,
          itemBuilder: (BuildContext context, int index) {
            final tweet = state.tweets[index];
            return TweetCard(tweet: tweet);
          },
        ),
      ),
    );
  }
}
