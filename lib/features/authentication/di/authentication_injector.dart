

import 'package:test_tarwej/di.dart';
import 'package:test_tarwej/features/authentication/data/repository_imp/authentication_repository_imp.dart';
import 'package:test_tarwej/features/authentication/domain/repository/authentication_repository.dart';
import 'package:test_tarwej/features/authentication/domain/uae_cases/register_use_case.dart';
import 'package:test_tarwej/features/authentication/data/graphql/authentication_graphql.dart';

class AuthenticationDi {
  static Future<void>initialize() async {
    // register bloc

    // register useCase

    injector.registerFactory(() => RegisterUseCase(injector()));

    // register repositoryImp

    injector.registerFactory<AuthenticationRepository>(() => AuthenticationRepositoryImp(injector()));

    // register dataSource
  }
}