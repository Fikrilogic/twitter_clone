// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:appwrite/appwrite.dart' as _i3;
import 'package:core/di/appwrite_module.dart' as _i4;
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
    final appwriteModule = _$AppwriteModule();
    gh.singleton<_i3.Client>(appwriteModule.provideAppwriteClient);
    gh.lazySingleton<_i3.Databases>(
        () => appwriteModule.provideDatabase(gh<_i3.Client>()));
    gh.lazySingleton<_i3.Realtime>(
        () => appwriteModule.provideRealtime(gh<_i3.Client>()));
    gh.lazySingleton<_i3.Storage>(
        () => appwriteModule.provideStorage(gh<_i3.Client>()));
    gh.factory<_i3.Account>(
        () => appwriteModule.provideAccount(gh<_i3.Client>()));
    return this;
  }
}

class _$AppwriteModule extends _i4.AppwriteModule {}
