import 'package:editor/api/gen/client_index.dart';
import 'package:editor/foundation/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @singleton
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @singleton
  ApiClient get client {
    final uri = Uri.http(Env().baseUrl, Env().apiPath);
    return ApiClient.create(
      baseUrl: uri,
    );
  }
}
