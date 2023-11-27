import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:core/core.dart';


@immutable
class Tweet extends Equatable{
  final String text;
  final List<String> hashtags;
  final String link;
  final List<String> imageLinks;
  final String uid;
  final TweetType tweetType;
  final DateTime tweetedAt;
  final List<String> likes;
  final List<String> commentIds;
  final String id;
  final int reshareCount;
  final String retweetedBy;
  final String repliedTo;

//<editor-fold desc="Data Methods">
  const Tweet({
    required this.text,
    required this.hashtags,
    required this.link,
    required this.imageLinks,
    required this.uid,
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
  String toString() {
    return 'Tweet{' +
        ' text: $text,' +
        ' hashtags: $hashtags,' +
        ' link: $link,' +
        ' imageLinks: $imageLinks,' +
        ' uid: $uid,' +
        ' tweetType: $tweetType,' +
        ' tweetedAt: $tweetedAt,' +
        ' likes: $likes,' +
        ' commentIds: $commentIds,' +
        ' id: $id,' +
        ' reshareCount: $reshareCount,' +
        ' retweetedBy: $retweetedBy,' +
        ' repliedTo: $repliedTo,' +
        '}';
  }

  Tweet copyWith({
    String? text,
    List<String>? hashtags,
    String? link,
    List<String>? imageLinks,
    String? uid,
    TweetType? tweetType,
    DateTime? tweetedAt,
    List<String>? likes,
    List<String>? commentIds,
    String? id,
    int? reshareCount,
    String? retweetedBy,
    String? repliedTo,
  }) {
    return Tweet(
      text: text ?? this.text,
      hashtags: hashtags ?? this.hashtags,
      link: link ?? this.link,
      imageLinks: imageLinks ?? this.imageLinks,
      uid: uid ?? this.uid,
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

  Map<String, dynamic> toMap() {
    return {
      'text': this.text,
      'hashtags': this.hashtags,
      'link': this.link,
      'imageLinks': this.imageLinks,
      'uid': this.uid,
      'tweetType': this.tweetType.type,
      'tweetedAt': this.tweetedAt.millisecondsSinceEpoch,
      'likes': this.likes,
      'commentIds': this.commentIds,
      'reshareCount': this.reshareCount,
      'retweetedBy': this.retweetedBy,
      'repliedTo': this.repliedTo,
    };
  }

  factory Tweet.fromMap(Map<String, dynamic> map) {
    return Tweet(
      text: map['text'] as String,
      hashtags: map['hashtags'] as List<String>,
      link: map['link'] as String,
      imageLinks: map['imageLinks'] as List<String>,
      uid: map['uid'] as String,
      tweetType: map['tweetType'] as TweetType,
      tweetedAt: map['tweetedAt'] as DateTime,
      likes: map['likes'] as List<String>,
      commentIds: map['commentIds'] as List<String>,
      id: map['id'] as String,
      reshareCount: map['reshareCount'] as int,
      retweetedBy: map['retweetedBy'] as String,
      repliedTo: map['repliedTo'] as String,
    );
  }

  @override
  List<Object?> get props => [
    text,hashtags, link, imageLinks, uid, tweetType, tweetedAt, likes, commentIds, id, reshareCount, retweetedBy, repliedTo
  ];

}