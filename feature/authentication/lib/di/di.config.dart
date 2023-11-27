// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:authentication/signin/bloc/signin_bloc.dart' as _i3;
import 'package:authentication/signup/bloc/signup_bloc.dart' as _i5;
import 'package:domain/domain.dart' as _i4;
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
    gh.factory<_i3.SigninBloc>(() => _i3.SigninBloc(
          gh<_i4.SignInEmailPassword>(),
          gh<_i4.CreateTweet>(),
        ));
    gh.factory<_i5.SignupBloc>(
        () => _i5.SignupBloc(gh<_i4.SignUpEmailPassword>()));
    return this;
  }
}
