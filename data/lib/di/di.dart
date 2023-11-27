import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:core/core.dart';

import 'di.config.dart';

// final GetIt getIt = GetIt.instance();

@InjectableInit()
void configureInjection() => getIt.init();