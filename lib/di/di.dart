
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'di.config.dart';
import 'package:core/core.dart';

// final GetIt getIt = GetIt.instance();

@InjectableInit()
void configurationInjection() => getIt.init();