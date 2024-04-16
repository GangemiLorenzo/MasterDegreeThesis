import 'package:editor/api/gen/client_index.dart';
import 'package:injectable/injectable.dart';

@injectable
class RestService {
  final ApiClient client;

  RestService({
    required this.client,
  });
}
