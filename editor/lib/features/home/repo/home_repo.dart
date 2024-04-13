import 'package:editor/service/rest_client.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeRepo {
  HomeRepo({
    required this.restClient,
  });

  final RestClient restClient;
}
