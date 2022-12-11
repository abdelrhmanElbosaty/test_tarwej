import 'package:test_tarwej/features/main_home/domain/reposatories/home_repository.dart';

class GetMostSailedUseCase {
  final HomeRepository _homeRepository;

  GetMostSailedUseCase(this._homeRepository);

  Future<void>excute() async {
    await _homeRepository.getMostSailed();
  }
}