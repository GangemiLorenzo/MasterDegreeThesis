import 'package:editor/service/storage_service.dart';
import 'package:injectable/injectable.dart';

const OPEN_AI_KEY = 'open_ai_key';

@injectable
class SecureSettingsRepo {
  SecureSettingsRepo({
    required this.storageService,
  });

  // TODO: Replace this service with the one actually secure
  final StorageService storageService;

  Future<bool> storeOpenAIKey({required String openAIKey}) =>
      storageService.setString(key: OPEN_AI_KEY, value: openAIKey);

  String getOpenAIKey() => storageService.getString(OPEN_AI_KEY) ?? '';
}
