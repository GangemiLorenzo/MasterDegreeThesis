// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:editor/api/gen/client_index.dart' as _i6;
import 'package:editor/app/state/global_settings/cubit/global_setting_cubit.dart'
    as _i16;
import 'package:editor/app/state/global_settings/repo/global_setting_repo.dart'
    as _i12;
import 'package:editor/app/state/secure_settings/cubit/secure_settings_cubit.dart'
    as _i14;
import 'package:editor/app/state/secure_settings/repo/secure_settings_repo.dart'
    as _i11;
import 'package:editor/app/state/secure_settings/secure_settings.dart' as _i15;
import 'package:editor/features/code/cubit/code_cubit.dart' as _i17;
import 'package:editor/features/code/repo/code_repo.dart' as _i13;
import 'package:editor/features/home/cubit/home_cubit.dart' as _i10;
import 'package:editor/features/home/repo/home_repo.dart' as _i9;
import 'package:editor/features/navbar/cubit/navbar_cubit.dart' as _i3;
import 'package:editor/foundation/di/register_module.dart' as _i18;
import 'package:editor/service/file_picker_service.dart' as _i4;
import 'package:editor/service/rest_service.dart' as _i8;
import 'package:editor/service/storage_service.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

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
    gh.factory<_i4.FilePickerService>(() => _i4.FilePickerService());
    await gh.singletonAsync<_i5.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i6.ApiClient>(() => registerModule.client);
    gh.singleton<_i7.StorageService>(
        () => _i7.StorageService(prefs: gh<_i5.SharedPreferences>()));
    gh.factory<_i8.RestService>(
        () => _i8.RestService(client: gh<_i6.ApiClient>()));
    gh.factory<_i9.HomeRepo>(
        () => _i9.HomeRepo(restService: gh<_i8.RestService>()));
    gh.factory<_i10.HomeCubit>(() => _i10.HomeCubit(repo: gh<_i9.HomeRepo>()));
    gh.factory<_i11.SecureSettingsRepo>(() =>
        _i11.SecureSettingsRepo(storageService: gh<_i7.StorageService>()));
    gh.factory<_i12.GlobalSettingRepo>(
        () => _i12.GlobalSettingRepo(storageService: gh<_i7.StorageService>()));
    gh.factory<_i13.CodeRepo>(() => _i13.CodeRepo(
          restService: gh<_i8.RestService>(),
          filePickerService: gh<_i4.FilePickerService>(),
        ));
    gh.singleton<_i14.SecureSettingsCubit>(
        () => _i14.SecureSettingsCubit(repo: gh<_i15.SecureSettingsRepo>()));
    gh.singleton<_i16.GlobalSettingCubit>(
        () => _i16.GlobalSettingCubit(repo: gh<_i12.GlobalSettingRepo>()));
    gh.factory<_i17.CodeCubit>(() => _i17.CodeCubit(repo: gh<_i13.CodeRepo>()));
    return this;
  }
}

class _$RegisterModule extends _i18.RegisterModule {}
