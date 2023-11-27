import 'package:authentication/config/authentication_config.dart';
import 'package:core/core.dart';
import 'package:data/config/data_config.dart';
import 'package:domain/config/domain_config.dart';
import 'package:twitter_clone/config/app_config.dart';
import 'package:home/home.dart';
import 'package:tweet/tweet.dart';


class AppInitializer {

  AppInitializer();

  FutureVoid init() async {
    await CoreConfig.getInstance().init();
    await DataConfig.getInstance().init();
    await DomainConfig.getInstance().init();

    await AuthenticationConfig.getInstance().init();
    await HomeConfig.getInstance().init();
    await TweetConfig.getInstance().init();
    await AppConfig.getInstance().init();

  }
}