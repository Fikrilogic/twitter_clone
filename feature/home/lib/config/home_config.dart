import 'package:core/core.dart';

import '../di/di.dart' as di;

class HomeConfig extends Config{

  HomeConfig._();

  factory HomeConfig.getInstance(){
    return _instance;
  }

  static final HomeConfig _instance = HomeConfig._();

  @override
  FutureVoid config() async{
    return di.configurationInjection();
  }

}