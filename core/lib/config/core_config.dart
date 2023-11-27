import 'package:core/base/config/base_config.dart';
import 'package:core/type_defs.dart';

import '../di/di.dart';

class CoreConfig extends Config{

  CoreConfig._();

  factory CoreConfig.getInstance(){
    return _instance;
  }

  static final CoreConfig _instance = CoreConfig._();

  @override
  FutureVoid config() async {
    return configureInjection();
  }

}