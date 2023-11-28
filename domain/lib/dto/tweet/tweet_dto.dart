import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:equatable/equatable.dart';

class TweetDto extends Equatable {
  final String text;
  final List<String> hashtags;
  final String link;
  final List<String> imageLinks;
  final UserModel? user;
  final TweetType tweetType;
  final DateTime tweetedAt;
  final List<String> likes;
  final List<String> commentIds;
  final String id;
  final int reshareCount;
  final String retweetedBy;
  final String repliedTo;

  const TweetDto({
    required this.text,
    required this.hashtags,
    required this.link,
    required this.imageLinks,
    this.user,
    required this.tweetType,
    required this.tweetedAt,
    required this.likes,
    required this.commentIds,
    required this.id,
    required this.reshareCount,
    required this.retweetedBy,
    required this.repliedTo,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        text,
        hashtags,
        link,
        imageLinks,
        tweetType,
        tweetedAt,
        likes,
        commentIds,
        id,
        reshareCount,
        retweetedBy,
        repliedTo
      ];

  TweetDto copyWith({
    String? text,
    List<String>? hashtags,
    String? link,
    List<String>? imageLinks,
    UserModel? user,
    TweetType? tweetType,
    DateTime? tweetedAt,
    List<String>? likes,
    List<String>? commentIds,
    String? id,
    int? reshareCount,
    String? retweetedBy,
    String? repliedTo,
  }) {
    return TweetDto(
      text: text ?? this.text,
      hashtags: hashtags ?? this.hashtags,
      link: link ?? this.link,
      imageLinks: imageLinks ?? this.imageLinks,
      user: user ?? this.user,
      tweetType: tweetType ?? this.tweetType,
      tweetedAt: tweetedAt ?? this.tweetedAt,
      likes: likes ?? this.likes,
      commentIds: commentIds ?? this.commentIds,
      id: id ?? this.id,
      reshareCount: reshareCount ?? this.reshareCount,
      retweetedBy: retweetedBy ?? this.retweetedBy,
      repliedTo: repliedTo ?? this.repliedTo,
    );
  }
}
