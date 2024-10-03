// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:editor/api/gen/client_index.dart' as _i366;
import 'package:editor/app/state/global_settings/cubit/global_setting_cubit.dart'
    as _i911;
import 'package:editor/app/state/global_settings/repo/global_setting_repo.dart'
    as _i490;
import 'package:editor/app/state/secure_settings/cubit/secure_settings_cubit.dart'
    as _i780;
import 'package:editor/app/state/secure_settings/repo/secure_settings_repo.dart'
    as _i448;
import 'package:editor/app/state/secure_settings/secure_settings.dart' as _i69;
import 'package:editor/features/code/cubit/code_cubit.dart' as _i791;
import 'package:editor/features/code/repo/code_repo.dart' as _i472;
import 'package:editor/features/home/cubit/home_cubit.dart' as _i130;
import 'package:editor/features/home/repo/home_repo.dart' as _i70;
import 'package:editor/features/navbar/cubit/navbar_cubit.dart' as _i626;
import 'package:editor/foundation/di/register_module.dart' as _i901;
import 'package:editor/service/file_picker_service.dart' as _i636;
import 'package:editor/service/rest_service.dart' as _i890;
import 'package:editor/service/storage_service.dart' as _i858;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i626.NavBarCubit>(() => _i626.NavBarCubit());
    gh.factory<_i636.FilePickerService>(() => _i636.FilePickerService());
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i366.ApiClient>(() => registerModule.client);
    gh.factory<_i890.RestService>(
        () => _i890.RestService(client: gh<_i366.ApiClient>()));
    gh.factory<_i70.HomeRepo>(
        () => _i70.HomeRepo(restService: gh<_i890.RestService>()));
    gh.factory<_i130.HomeCubit>(
        () => _i130.HomeCubit(repo: gh<_i70.HomeRepo>()));
    gh.singleton<_i858.StorageService>(
        () => _i858.StorageService(prefs: gh<_i460.SharedPreferences>()));
    gh.factory<_i448.SecureSettingsRepo>(() =>
        _i448.SecureSettingsRepo(storageService: gh<_i858.StorageService>()));
    gh.factory<_i490.GlobalSettingRepo>(() =>
        _i490.GlobalSettingRepo(storageService: gh<_i858.StorageService>()));
    gh.factory<_i472.CodeRepo>(() => _i472.CodeRepo(
          restService: gh<_i890.RestService>(),
          filePickerService: gh<_i636.FilePickerService>(),
        ));
    gh.singleton<_i780.SecureSettingsCubit>(
        () => _i780.SecureSettingsCubit(repo: gh<_i69.SecureSettingsRepo>()));
    gh.singleton<_i911.GlobalSettingCubit>(
        () => _i911.GlobalSettingCubit(repo: gh<_i490.GlobalSettingRepo>()));
    gh.factory<_i791.CodeCubit>(
        () => _i791.CodeCubit(repo: gh<_i472.CodeRepo>()));
    return this;
  }
}

class _$RegisterModule extends _i901.RegisterModule {}
