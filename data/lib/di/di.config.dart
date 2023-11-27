// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:appwrite/appwrite.dart' as _i4;
import 'package:data/di/repository_module.dart' as _i8;
import 'package:data/repository/auth/auth_repository.dart' as _i3;
import 'package:data/repository/storage/storage_repository.dart' as _i5;
import 'package:data/repository/tweet/tweet_repository.dart' as _i6;
import 'package:data/repository/user/user_repository.dart' as _i7;
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
    final repositoryModule = _$RepositoryModule();
    gh.factory<_i3.IAuthRepository>(
        () => repositoryModule.provideAuthApi(gh<_i4.Account>()));
    gh.factory<_i5.IStorageRepository>(
        () => repositoryModule.provideStorageApi(gh<_i4.Storage>()));
    gh.factory<_i6.ITweetRepository>(
        () => repositoryModule.provideTweetRepository(
              gh<_i4.Databases>(),
              gh<_i4.Realtime>(),
            ));
    gh.factory<_i7.IUserRepository>(
        () => repositoryModule.provideUserRepository(gh<_i4.Databases>()));
    return this;
  }
}

class _$RepositoryModule extends _i8.RepositoryModule {}
