part of 'create_tweet_bloc.dart';

abstract class CreateTweetState extends Equatable {
  const CreateTweetState();
}

class CreateTweetInitial extends CreateTweetState {
  final bool loading;
  final String message;
  final UserModel? user;
  final String tweetInput;
  final List<File> images;

  const CreateTweetInitial({
    this.loading = false,
    this.message = '',
    this.user,
    this.tweetInput = '',
    this.images = const [],
  });


  @override
  List<Object> get props => [loading, message, tweetInput];

  CreateTweetInitial copyWith({
    bool? loading,
    String? message,
    UserModel? user,
    String? tweetInput,
    List<File>? images
  }) {
    return CreateTweetInitial(
      loading: loading ?? this.loading,
      message: message ?? this.message,
      user: user,
      tweetInput: tweetInput ?? this.tweetInput,
      images: images ?? this.images
    );
  }
}
