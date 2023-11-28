// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:domain/domain.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:tweet/view/create/bloc/create_tweet_bloc.dart' as _i3;
import 'package:tweet/view/list/bloc/tweet_list_bloc.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.CreateTweetBloc>(() => _i3.CreateTweetBloc(
          gh<_i4.GetUserData>(),
          gh<_i4.CreateTweet>(),
          gh<_i4.CreateTweetWithImage>(),
        ));
    gh.factory<_i5.TweetListBloc>(() => _i5.TweetListBloc(
          gh<_i4.GetTweetStream>(),
          gh<_i4.GetTweet>(),
        ));
    return this;
  }
}
