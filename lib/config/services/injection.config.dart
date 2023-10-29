// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:komunitas_belajar/config/helper/api_helper.dart' as _i4;
import 'package:komunitas_belajar/config/services/call_api_service.dart' as _i7;
import 'package:komunitas_belajar/data/repository/app_repository_impl.dart'
    as _i6;
import 'package:komunitas_belajar/domain/entities/global.dart' as _i8;
import 'package:komunitas_belajar/domain/repository/app_repository.dart' as _i5;
import 'package:komunitas_belajar/presentation/pages/about_us/about_us_cubit.dart'
    as _i3;
import 'package:komunitas_belajar/presentation/pages/home/home_cubit.dart'
    as _i9;
import 'package:komunitas_belajar/presentation/pages/login/login_cubit.dart'
    as _i10;
import 'package:komunitas_belajar/presentation/pages/member/member_cubit.dart'
    as _i11;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.AboutUsCubit>(() => _i3.AboutUsCubit());
  gh.lazySingleton<_i4.ApiHelper>(() => _i4.ApiHelper());
  gh.lazySingleton<_i5.AppRepository>(() => _i6.AppRepositoryImpl());
  gh.lazySingleton<_i7.CallApiService>(() => _i7.CallApiService());
  gh.lazySingleton<_i8.Global>(() => _i8.Global());
  gh.lazySingleton<_i9.HomeCubit>(() => _i9.HomeCubit());
  gh.lazySingleton<_i10.LoginCubit>(() => _i10.LoginCubit());
  gh.lazySingleton<_i11.MemberCubit>(() => _i11.MemberCubit());
  return getIt;
}
