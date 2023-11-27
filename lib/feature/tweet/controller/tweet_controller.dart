import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/api/tweet_api.dart';
import 'package:twitter_clone/core/enum/tweet_enum_type.dart';
import 'package:twitter_clone/feature/auth/controller/auth_controller.dart';
import 'package:twitter_clone/model/tweet_model.dart';

import '../../../api/storage_api.dart';
import '../../../core/core.dart';

final tweetControllerProvider = StateNotifierProvider<TweetController, bool>(
  (ref) {
    return TweetController(
      ref: ref,
      tweetApi: ref.watch(tweetApiProvider),
      storageApi: ref.watch(storageApiProvider),
    );
  },
);

final getTweetProvider = FutureProvider((ref) async {
  final controller = ref.watch(tweetControllerProvider.notifier);
  return controller.getTweets();
});

final getLatestTweetProvider = StreamProvider((ref) {
  final api = ref.watch(tweetApiProvider);
  return api.getTweetLatest();
});

class TweetController extends StateNotifier<bool> {
  TweetController(
      {required Ref ref,
      required TweetApi tweetApi,
      required StorageApi storageApi})
      : _ref = ref,
        _tweetApi = tweetApi,
        _storageApi = storageApi,
        super(false);

  final Ref _ref;
  final TweetApi _tweetApi;
  final StorageApi _storageApi;

  Future<List<Tweet>> getTweets() async {
    final documents = await _tweetApi.getTweet();
    return documents.map((document) => Tweet.fromMap(document.data)).toList();
  }

  void shareTweet({
    required String text,
    required List<File> images,
    required BuildContext context,
    required String repliedTo,
    required String repliedToUserId,
  }) {
    if (images.isEmpty) {
      _createTweet(
          text: text,
          context: context,
          repliedTo: repliedTo,
          repliedToUserId: repliedToUserId);
    } else {
      _createTweetWithImage(
          text: text,
          context: context,
          repliedTo: repliedTo,
          repliedToUserId: repliedToUserId,
          images: images);
    }
  }

  void _createTweet({
    required String text,
    required BuildContext context,
    required String repliedTo,
    required String repliedToUserId,
  }) async {
    state = true;
    final link = _getLinkFromString(text);
    final hastags = _getHastagFromString(text);
    final user = _ref.read(currentUserAccountProvider).value!;
    final data = Tweet(
      text: text,
      hashtags: hastags,
      link: link,
      imageLinks: List.empty(),
      uid: user.$id,
      tweetType: TweetType.text,
      tweetedAt: DateTime.now(),
      likes: List.empty(),
      commentIds: List.empty(),
      id: '',
      reshareCount: 0,
      retweetedBy: '',
      repliedTo: repliedTo,
    );

    final res = await _tweetApi.shareTweet(data);
    res.fold((l) => showSnackbar(context, l.message), (r) {
      showSnackbar(context, 'share your tweet successfully');
    });
    state = false;
  }

  void _createTweetWithImage({
    required String text,
    required BuildContext context,
    required String repliedTo,
    required String repliedToUserId,
    required List<File> images,
  }) async {
    state = true;
    final link = _getLinkFromString(text);
    final hastags = _getHastagFromString(text);
    final user = _ref.read(currentUserAccountProvider).value!;
    final imageLinks = await _storageApi.createFile(images);
    final data = Tweet(
      text: text,
      hashtags: hastags,
      link: link,
      imageLinks: imageLinks,
      uid: user.$id,
      tweetType: TweetType.image,
      tweetedAt: DateTime.now(),
      likes: List.empty(),
      commentIds: List.empty(),
      id: '',
      reshareCount: 0,
      retweetedBy: '',
      repliedTo: repliedTo,
    );

    final res = await _tweetApi.shareTweet(data);
    state = false;
    res.fold((l) => showSnackbar(context, l.message), (r) {
      showSnackbar(context, "share your tweet successfully");
    });
  }

  String _getLinkFromString(String text) {
    String link = '';
    List<String> wordInSentence = text.split(' ');
    for (String word in wordInSentence) {
      if (word.startsWith('https://') || word.startsWith('www.')) {
        link = word;
      }
    }
    return link;
  }

  List<String> _getHastagFromString(String text) {
    List<String> hashtags = [];
    List<String> wordInSentence = text.split(' ');
    for (String word in wordInSentence) {
      if (word.startsWith('#')) {
        hashtags.add(word);
      }
    }
    return hashtags;
  }
}
