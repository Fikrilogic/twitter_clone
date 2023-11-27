
import 'package:authentication/di/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:core/core.dart';
//
// final GetIt getit = GetIt.instance();

@InjectableInit()
void configurationInjection() => getIt.init();