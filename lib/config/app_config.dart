import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:twitter_clone/initializer/app_bloc_observer.dart';

import '../di/di.dart' as di;

class AppConfig extends Config{

  AppConfig._();

  factory AppConfig.getInstance(){
    return _instance;
  }

  static final AppConfig _instance = AppConfig._();

  @override
  FutureVoid config() async{
    di.configurationInjection();
    Bloc.observer = AppBlocObserver();
  }

}