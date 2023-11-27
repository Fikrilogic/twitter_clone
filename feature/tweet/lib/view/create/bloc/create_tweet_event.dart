part of 'create_tweet_bloc.dart';

abstract class CreateTweetEvent extends Equatable {
  const CreateTweetEvent();
}

class OnLoadCurrentUser extends CreateTweetEvent{
  const OnLoadCurrentUser();

  @override
  List<Object?> get props => [];
}

class OnTextfieldTweetChange extends CreateTweetEvent{
  final String input;

  const OnTextfieldTweetChange(this.input);

  @override
  // TODO: implement props
  List<Object?> get props => [input];
}

class OnImagePickToUpload extends CreateTweetEvent{
  final List<File> images;

  const OnImagePickToUpload(this.images);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnClickShareTweet extends CreateTweetEvent{

  final String uid;
  final Function() callback;

  const OnClickShareTweet({required this.uid, required this.callback});

  @override
  List<Object> get props => [];
}

