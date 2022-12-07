import 'package:test_tarwej/features/authentication/data/graphql/authentication_graphql.dart';
import 'package:test_tarwej/features/authentication/data/models/register/api_register_input.dart';
import 'package:test_tarwej/features/authentication/data/models/register/api_register_result.dart';
import 'package:test_tarwej/features/authentication/domain/Entity/register/register_model.dart';
import 'package:test_tarwej/features/authentication/domain/repository/authentication_repository.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test_tarwej/utils/exception_errors.dart';
import 'package:test_tarwej/utils/graphql_extensions.dart';

class AuthenticationRepositoryImp implements AuthenticationRepository {

  final GraphQLClient _graphQLClient;

  AuthenticationRepositoryImp(this._graphQLClient);

  @override
  Future<void> register(RegisterModel input) async {

    final result = await _graphQLClient.perform(
        mutation: registerMutation,
        variables: {
            "registerInput": ApiRegisterInput.fromRegisterInput(input)
        }
    );
    if (result.hasException || result.data == null) {
      throw const ServerException();
    } else {

      final request = Data.fromJson(result.data!).register;

     if (request.code == 200) {
          return;
      } else {
          throw ApiRequestException(
               request.code,
              request.message
           );
      }
    }
  }
}