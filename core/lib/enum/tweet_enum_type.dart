enum TweetType {
  text('text'),
  image('image');

  final String type;
  const TweetType(this.type);
}

extension ConvertTweet on String {
  TweetType toTweetEnum() {
    switch (this) {
      case 'text':
        return TweetType.text;
      case 'image':
        return TweetType.image;
      default:
        return TweetType.text;
    }
  }
}
