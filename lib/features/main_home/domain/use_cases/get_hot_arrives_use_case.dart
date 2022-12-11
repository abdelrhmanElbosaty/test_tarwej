import 'package:test_tarwej/features/main_home/domain/reposatories/home_repository.dart';

class GetHotArrivesUseCase {
  final HomeRepository _homeRepository;

  GetHotArrivesUseCase(this._homeRepository);

  Future<void>excute() async {
    await _homeRepository.getHotArrives();
  }
}