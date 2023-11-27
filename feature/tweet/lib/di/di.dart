
import 'package:core/core.dart';
import 'package:injectable/injectable.dart';
import 'di.config.dart';

@InjectableInit()
void configureInjection() => getIt.init();