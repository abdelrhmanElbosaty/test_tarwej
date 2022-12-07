import 'package:test_tarwej/features/authentication/domain/Entity/register/register_model.dart';
import 'package:test_tarwej/features/authentication/domain/repository/authentication_repository.dart';

class RegisterUseCase {
  final AuthenticationRepository _authenticationRepository;

  RegisterUseCase(this._authenticationRepository);

  Future<void> excute(RegisterModel input) async {
    await _authenticationRepository.register(input);
  }
}