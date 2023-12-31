import 'package:commons/commons.dart';
import 'package:core/core.dart';
import 'package:domain/dto/tweet/tweet_dto.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tweet/view/widget/carousel_image.dart';

class TweetCard extends StatelessWidget {
  final TweetDto tweet;

  const TweetCard({super.key, required this.tweet});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  backgroundImage: NetworkImage(tweet.user!.profilePic),
                  radius: 35,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (tweet.retweetedBy.isNotEmpty)
                    Row(
                      children: [
                        SvgPicture.asset(
                          AssetsConstants.retweetIcon,
                          color: Pallete.greyColor,
                          height: 20,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          '${tweet.retweetedBy} retweeted',
                          style: const TextStyle(
                            color: Pallete.greyColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          right: tweet.user!.isTwitterBlue ? 1 : 5,
                        ),
                        child: Text(
                          tweet.user!.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                      ),
                      if (tweet.user!.isTwitterBlue)
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: SvgPicture.asset(
                            AssetsConstants.verifiedIcon,
                          ),
                        ),
                      Text(
                        '@${tweet.user!.name} · ${timeago.format(
                          tweet.tweetedAt,
                          locale: 'en_short',
                        )}',
                        style: const TextStyle(
                          color: Pallete.greyColor,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  HashtagText(text: tweet.text),
                  if (tweet.tweetType == TweetType.image)
                    CarouselImage(imageLinks: tweet.imageLinks),
                  if (tweet.link.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    AnyLinkPreview(
                      displayDirection: UIDirection.uiDirectionHorizontal,
                      link: 'https://${tweet.link}',
                    ),
                  ]
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
