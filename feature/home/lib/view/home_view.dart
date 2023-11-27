import 'package:commons/commons.dart';
import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tweet/tweet.dart';
import 'package:tweet/view/list/tweet_list.dart';

import '../widget/bottom_bar.dart';

class HomeView extends StatefulWidget {

  static route() => MaterialPageRoute(
    builder: (context) => const HomeView(),
  );

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  int _page = 0;
  List<Tweet> tweets = [];

  void onChangePage(int index) {
    setState(() {
      _page = index;
    });
  }

  void onCreateTweet() {
    Navigator.push(context, CreateTweetView.route());
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
          children: const [TweetList()],
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
