import 'package:get_it/get_it.dart';
import 'package:test_tarwej/features/authentication/di/authentication_injector.dart';
import 'package:test_tarwej/utils/data_di.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  await initializeModulesDependencies();
}

Future<void> initializeModulesDependencies() async {
  await DataDi.initialize();
  await AuthenticationDi.initialize();
}