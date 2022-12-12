import 'package:test_tarwej/features/main_home/data/models/all_section/api_featured_stores_result.dart';
import 'package:test_tarwej/features/main_home/domain/reposatories/home_repository.dart';

class GetSpecialStoresUseCase {
  final HomeRepository _homeRepository;

  GetSpecialStoresUseCase(this._homeRepository);

  Future<List<Store>>excute() async {
    return await _homeRepository.getSpecialStores();
  }
}