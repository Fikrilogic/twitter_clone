import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:core/core.dart';
import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tweet/view/create/bloc/create_tweet_bloc.dart';

class CreateTweetView extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const CreateTweetView(),
      );

  const CreateTweetView({super.key});

  @override
  State<CreateTweetView> createState() => _CreateTweetViewState();
}

class _CreateTweetViewState extends State<CreateTweetView> {
  final CreateTweetBloc _createTweetBloc = getIt.get();
  List<File> images = [];

  void navigateBack() {
    Navigator.pop(context);
  }

  void onPickImages() async {
    images = await pickImages();
    setState(() {});
  }

  void onSubmitTweet() {
    _createTweetBloc.add(
      OnClickShareTweet(
        uid: _createTweetBloc.state.user?.uid ?? '',
        callback: () {
          navigateBack();
        },
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _createTweetBloc.add(const OnLoadCurrentUser());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateTweetBloc>.value(
      value: _createTweetBloc,
      child: SafeArea(
        minimum: const EdgeInsets.all(8),
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: navigateBack,
              icon: const Icon(
                Icons.close,
                size: 30,
              ),
            ),
            actions: [
              RoundedSmallButton(
                onTap: onSubmitTweet,
                label: 'Tweet',
                backgroundColor: Pallete.blueColor,
                textColor: Pallete.whiteColor,
              ),
            ],
          ),
          body: BlocBuilder<CreateTweetBloc, CreateTweetInitial>(
            buildWhen: (prev,cur) => prev.loading != cur.loading,
            builder: (context, state) {
              return state.loading ? const Loader() : state.user == null
                  ? const Loader()
                  : SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                            NetworkImage(state.user?.profilePic ?? ''),
                            radius: 30,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: TextField(
                              onChanged: (value) => _createTweetBloc
                                  .add(OnTextfieldTweetChange(value)),
                              style: const TextStyle(
                                fontSize: 22,
                              ),
                              decoration: const InputDecoration(
                                hintText: "What's Happening?",
                                hintStyle: TextStyle(
                                  color: Pallete.greyColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                                border: InputBorder.none,
                              ),
                              maxLines: null,
                            ),
                          )
                        ],
                      ),
                      if (images.isNotEmpty)
                        CarouselSlider(
                          items: images
                              .map(
                                (file) => Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              child: Image.file(file),
                            ),
                          )
                              .toList(),
                          options: CarouselOptions(
                            height: 400,
                            enableInfiniteScroll: false,
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.only(bottom: 10),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Pallete.greyColor,
                  width: 0.3,
                ),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding:
                  const EdgeInsets.all(8.0).copyWith(left: 15, right: 15),
                  child: GestureDetector(
                    onTap: onPickImages,
                    child: SvgPicture.asset(AssetsConstants.galleryIcon),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.all(8.0).copyWith(left: 15, right: 15),
                  child: SvgPicture.asset(AssetsConstants.gifIcon),
                ),
                Padding(
                  padding:
                  const EdgeInsets.all(8.0).copyWith(left: 15, right: 15),
                  child: SvgPicture.asset(AssetsConstants.emojiIcon),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
