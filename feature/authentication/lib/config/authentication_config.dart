import 'package:core/core.dart';

import '../di/di.dart' as di;

class AuthenticationConfig extends Config{

  AuthenticationConfig._();

  factory AuthenticationConfig.getInstance(){
    return _instance;
  }

  static final AuthenticationConfig _instance = AuthenticationConfig._();

  @override
  FutureVoid config() async{
    return di.configurationInjection();
  }

}