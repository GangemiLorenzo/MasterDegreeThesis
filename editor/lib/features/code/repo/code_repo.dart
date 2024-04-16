import 'package:editor/service/rest_client.dart';
import 'package:injectable/injectable.dart';

@injectable
class CodeRepo {
  CodeRepo({
    required this.restClient,
  });

  final RestClient restClient;
}
