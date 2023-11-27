import 'package:bloc/bloc.dart';
import 'package:data/model/tweet/tweet_model.dart';
import 'package:domain/usecase/tweet/get_tweet_stream.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'tweet_list_event.dart';

part 'tweet_list_state.dart';

@injectable
class TweetListBloc extends Bloc<TweetListEvent, TweetListInitial> {
  final GetTweetStream _getTweetStream;

  TweetListBloc(this._getTweetStream) : super(const TweetListInitial()) {
    on<OnLoadTweetLatest>(_onLoadTweetLatest);
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
}
