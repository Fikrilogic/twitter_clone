

import 'package:core/core.dart';
import '../di/di.dart' as di;

class TweetConfig extends Config{

  TweetConfig._();

  factory TweetConfig.getInstance(){
    return _instance;
  }

  static final TweetConfig _instance = TweetConfig._();

  @override
  FutureVoid config() async {
    return di.configureInjection();
  }

}