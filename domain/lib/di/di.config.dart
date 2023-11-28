// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/data.dart' as _i4;
import 'package:domain/usecase/auth/check_user_session.dart' as _i3;
import 'package:domain/usecase/auth/signin_email_password.dart' as _i10;
import 'package:domain/usecase/auth/signup_email_password.dart' as _i11;
import 'package:domain/usecase/tweet/create_tweet.dart' as _i5;
import 'package:domain/usecase/tweet/create_tweet_with_image.dart' as _i6;
import 'package:domain/usecase/tweet/get_tweet.dart' as _i7;
import 'package:domain/usecase/tweet/get_tweet_stream.dart' as _i8;
import 'package:domain/usecase/user/get_user_data.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

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
    gh.factory<_i3.CheckUserSession>(
        () => _i3.CheckUserSession(gh<_i4.IAuthRepository>()));
    gh.factory<_i5.CreateTweet>(
        () => _i5.CreateTweet(gh<_i4.ITweetRepository>()));
    gh.factory<_i6.CreateTweetWithImage>(() => _i6.CreateTweetWithImage(
          gh<_i4.ITweetRepository>(),
          gh<_i4.IStorageRepository>(),
        ));
    gh.factory<_i7.GetTweet>(() => _i7.GetTweet(
          gh<_i4.ITweetRepository>(),
          gh<_i4.IUserRepository>(),
        ));
    gh.factory<_i8.GetTweetStream>(
        () => _i8.GetTweetStream(gh<_i4.ITweetRepository>()));
    gh.factory<_i9.GetUserData>(() => _i9.GetUserData(
          gh<_i4.IAuthRepository>(),
          gh<_i4.IUserRepository>(),
        ));
    gh.factory<_i10.SignInEmailPassword>(
        () => _i10.SignInEmailPassword(gh<_i4.IAuthRepository>()));
    gh.factory<_i11.SignUpEmailPassword>(() => _i11.SignUpEmailPassword(
          gh<_i4.IUserRepository>(),
          gh<_i4.IAuthRepository>(),
        ));
    return this;
  }
}
