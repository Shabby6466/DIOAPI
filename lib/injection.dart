import 'package:dioapi/routes/navigation_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<NavigationService>(NavigationServiceImpl());
}
