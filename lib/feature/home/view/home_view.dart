import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter_clone/constant/assets_constant.dart';
import 'package:twitter_clone/feature/home/widget/bottom_bar.dart';
import 'package:twitter_clone/feature/tweet/view/create_tweet_view.dart';
import 'package:twitter_clone/theme/theme.dart';

import '../../../commons/commons.dart';
import '../../../model/tweet_model.dart';

class HomeView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const HomeView(),
      );

  const HomeView({super.key});

  @override
  ConsumerState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  int _page = 0;
  List<Tweet> tweets = [];

  void onChangePage(int index) {
    setState(() {
      _page = index;
    });
  }

  void onCreateTweet() {
    Navigator.push(context, CreateTweetScreen.route());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: ReusableAppBar(
            onClickBack: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: IndexedStack(
          index: _page,
          children: const [Text("")],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: onCreateTweet,
          child: const Icon(
            Icons.add,
            color: Pallete.whiteColor,
            size: 28,
          ),
        ),
        bottomNavigationBar: HomeBottomBar(
          onTap: onChangePage,
          children: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _page == 0
                    ? AssetsConstants.homeFilledIcon
                    : AssetsConstants.homeOutlinedIcon,
                color: Pallete.whiteColor,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AssetsConstants.searchIcon,
                color: Pallete.whiteColor,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _page == 2
                    ? AssetsConstants.notifFilledIcon
                    : AssetsConstants.notifOutlinedIcon,
                color: Pallete.whiteColor,
              ),
            ),
          ],
        ));
  }
}
