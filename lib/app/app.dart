import 'package:flutter/material.dart';
import 'package:commons/commons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_clone/app/app_bloc.dart';
import 'package:core/core.dart';
import 'package:authentication/authentication.dart';
import 'package:home/home.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appBloc = getIt.get<AppBloc>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _appBloc.add(const LoadUserSession());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      home: BlocProvider<AppBloc>.value(
        value: _appBloc,
        child: BlocBuilder<AppBloc, AppInitial>(
          buildWhen: (prev, cur) => prev.loading != cur.loading,
          builder: (context, state) {
            return state.loading
                ? const LoaderPage()
                : !state.isLogged
                    ? const SigninView()
                    : const HomeView();
          },
        ),
      ),
    );
  }
}
