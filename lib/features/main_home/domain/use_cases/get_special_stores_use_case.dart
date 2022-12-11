import 'package:test_tarwej/features/main_home/domain/reposatories/home_repository.dart';

class GetSpecialStoresUseCase {
  final HomeRepository _homeRepository;

  GetSpecialStoresUseCase(this._homeRepository);

  Future<void>excute() async {
    await _homeRepository.getSpecialStores();
  }
}