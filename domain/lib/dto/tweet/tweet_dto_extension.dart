import 'package:data/data.dart';
import 'package:domain/dto/tweet/tweet_dto.dart';

extension ConvertTweetToDto on Tweet {
  TweetDto toDto() {
    return TweetDto(
      text: this.text,
      hashtags: this.hashtags,
      link: this.link,
      likes: this.likes,
      imageLinks: this.imageLinks,
      tweetType: this.tweetType,
      tweetedAt: this.tweetedAt,
      commentIds: this.commentIds,
      id: this.id,
      reshareCount: this.reshareCount,
      retweetedBy: this.retweetedBy,
      repliedTo: this.repliedTo,
    );
  }
}
