// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:editor/app/state/global_settings/cubit/global_setting_cubit.dart'
    as _i14;
import 'package:editor/app/state/global_settings/repo/global_setting_repo.dart'
    as _i9;
import 'package:editor/app/state/secure_settings/cubit/secure_settings_cubit.dart'
    as _i10;
import 'package:editor/app/state/secure_settings/repo/secure_settings_repo.dart'
    as _i8;
import 'package:editor/app/state/secure_settings/secure_settings.dart' as _i11;
import 'package:editor/features/code/cubit/code_cubit.dart' as _i16;
import 'package:editor/features/code/repo/code_repo.dart' as _i13;
import 'package:editor/features/home/cubit/home_cubit.dart' as _i15;
import 'package:editor/features/home/repo/home_repo.dart' as _i12;
import 'package:editor/features/navbar/cubit/navbar_cubit.dart' as _i3;
import 'package:editor/foundation/di/register_module.dart' as _i17;
import 'package:editor/service/rest_client.dart' as _i7;
import 'package:editor/service/storage_service.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.NavBarCubit>(() => _i3.NavBarCubit());
    await gh.singletonAsync<_i4.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i5.Dio>(() => registerModule.dio);
    gh.singleton<_i6.StorageService>(
        () => _i6.StorageService(prefs: gh<_i4.SharedPreferences>()));
    gh.singleton<_i7.RestClient>(() => _i7.RestClient(dio: gh<_i5.Dio>()));
    gh.factory<_i8.SecureSettingsRepo>(
        () => _i8.SecureSettingsRepo(storageService: gh<_i6.StorageService>()));
    gh.factory<_i9.GlobalSettingRepo>(
        () => _i9.GlobalSettingRepo(storageService: gh<_i6.StorageService>()));
    gh.singleton<_i10.SecureSettingsCubit>(
        () => _i10.SecureSettingsCubit(repo: gh<_i11.SecureSettingsRepo>()));
    gh.factory<_i12.HomeRepo>(
        () => _i12.HomeRepo(restClient: gh<_i7.RestClient>()));
    gh.factory<_i13.HomeRepo>(
        () => _i13.HomeRepo(restClient: gh<_i7.RestClient>()));
    gh.singleton<_i14.GlobalSettingCubit>(
        () => _i14.GlobalSettingCubit(repo: gh<_i9.GlobalSettingRepo>()));
    gh.factory<_i15.HomeCubit>(() => _i15.HomeCubit(repo: gh<_i12.HomeRepo>()));
    gh.factory<_i16.CodeCubit>(() => _i16.CodeCubit(repo: gh<_i12.HomeRepo>()));
    return this;
  }
}

class _$RegisterModule extends _i17.RegisterModule {}
