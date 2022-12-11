import 'package:test_tarwej/features/main_home/data/models/all_section/api_all_section_result.dart';
import 'package:test_tarwej/features/main_home/domain/reposatories/home_repository.dart';

class GetAlLSectionUseCase {
  final HomeRepository _homeRepository;

  GetAlLSectionUseCase(this._homeRepository);

  Future<List<Category>> excute() async {
   return await _homeRepository.getAllSections();
  }
}