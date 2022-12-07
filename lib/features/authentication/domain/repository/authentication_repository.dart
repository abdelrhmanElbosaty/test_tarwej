import 'package:test_tarwej/features/authentication/domain/Entity/register/register_model.dart';

abstract class AuthenticationRepository {
  Future<void> register(RegisterModel input);
}