import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:twitter_clone/initializer/app_initializer.dart';

import 'app/app.dart';

void main(){
  bootstrap();
}

void bootstrap() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await AppInitializer().init();
    runApp(const App());
  }, (error, stack) => log(error.toString(), stackTrace: stack));
}
//
// class App extends ConsumerWidget {
//   const App({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: AppTheme.theme,
//       home: ref.watch(currentUserAccountProvider).when(
//           data: (user) {
//             return user == null ? const SignUpView() : const HomeView();
//           },
//           error: (e, st) => const LoginView(),
//           loading: () => const LoaderPage()),
//     );
//   }

// This widget is the root of your application.
// }
