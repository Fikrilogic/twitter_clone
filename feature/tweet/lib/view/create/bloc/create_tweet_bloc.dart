import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'create_tweet_event.dart';

part 'create_tweet_state.dart';

@injectable
class CreateTweetBloc extends Bloc<CreateTweetEvent, CreateTweetInitial> {
  final GetUserData getUserData;
  final CreateTweet createTweet;
  final CreateTweetWithImage createTweetWithImage;

  CreateTweetBloc(this.getUserData, this.createTweet, this.createTweetWithImage)
      : super(const CreateTweetInitial()) {
    on<OnLoadCurrentUser>(_loadCurrentUser);
    on<OnTextfieldTweetChange>(_tweetInputChange);
    on<OnImagePickToUpload>(_onImagePick);
    on<OnClickShareTweet>(_onShareTweet);
  }

  void _loadCurrentUser(
      OnLoadCurrentUser event, Emitter<CreateTweetInitial> emit) async {
    emit(state.copyWith(loading: true));
    var res = await getUserData.execute(const GetUserDataInput());
    if (res.user != null) {
      emit(state.copyWith(user: res.user, loading: false));
    } else {
      emit(state.copyWith(loading: false));
    }
  }

  void _tweetInputChange(
      OnTextfieldTweetChange event, Emitter<CreateTweetInitial> emit) {
    emit(state.copyWith(tweetInput: event.input));
  }

  void _onImagePick(
      OnImagePickToUpload event, Emitter<CreateTweetInitial> emit) {
    emit(state.copyWith(images: event.images));
  }

  void _onShareTweet(
      OnClickShareTweet event, Emitter<CreateTweetInitial> emit) async {
    emit(state.copyWith(loading: true));
    var hashtags = getHastagFromString(state.tweetInput);
    var links = getLinkFromString(state.tweetInput);

    var tweet = Tweet(
        text: state.tweetInput,
        hashtags: hashtags,
        link: links,
        imageLinks: const [],
        uid: event.uid,
        tweetType: state.images.isEmpty ? TweetType.text : TweetType.image,
        tweetedAt: DateTime.now(),
        likes: const [],
        commentIds: const [],
        id: '',
        reshareCount: 0,
        retweetedBy: '',
        repliedTo: '');

    var res = state.images.isEmpty
        ? await createTweet.execute(CreateTweetInput(tweet: tweet))
        : await createTweetWithImage.execute(
            CreateTweetWithImageInput(tweet: tweet, images: state.images));

    res.fold((l) => emit(state.copyWith(message: l.message)), (r) => event.callback);

  }
}
