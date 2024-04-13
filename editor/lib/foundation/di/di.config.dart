// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:editor/app/state/global_settings/cubit/global_setting_cubit.dart'
    as _i9;
import 'package:editor/app/state/global_settings/repo/global_setting_repo.dart'
    as _i7;
import 'package:editor/features/home/cubit/home_cubit.dart' as _i10;
import 'package:editor/features/home/repo/home_repo.dart' as _i8;
import 'package:editor/foundation/di/register_module.dart' as _i11;
import 'package:editor/service/rest_client.dart' as _i6;
import 'package:editor/service/storage_service.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

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
    await gh.singletonAsync<_i3.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i4.Dio>(() => registerModule.dio);
    gh.singleton<_i5.StorageService>(
        () => _i5.StorageService(prefs: gh<_i3.SharedPreferences>()));
    gh.singleton<_i6.RestClient>(() => _i6.RestClient(dio: gh<_i4.Dio>()));
    gh.factory<_i7.GlobalSettingRepo>(
        () => _i7.GlobalSettingRepo(storageService: gh<_i5.StorageService>()));
    gh.factory<_i8.HomeRepo>(
        () => _i8.HomeRepo(restClient: gh<_i6.RestClient>()));
    gh.singleton<_i9.GlobalSettingCubit>(
        () => _i9.GlobalSettingCubit(repo: gh<_i7.GlobalSettingRepo>()));
    gh.factory<_i10.HomeCubit>(() => _i10.HomeCubit(repo: gh<_i8.HomeRepo>()));
    return this;
  }
}

class _$RegisterModule extends _i11.RegisterModule {}
