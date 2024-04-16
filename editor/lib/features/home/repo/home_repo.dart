import 'package:editor/service/rest_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeRepo {
  HomeRepo({
    required this.restService,
  });

  final RestService restService;
}
