import 'package:core/core.dart';

import '../di/di.dart' as di;

class DataConfig extends Config{

  DataConfig._();

  factory DataConfig.getInstance(){
    return _instance;
  }

  static final DataConfig _instance = DataConfig._();

  @override
  FutureVoid config() async {
    return di.configureInjection();
  }

}