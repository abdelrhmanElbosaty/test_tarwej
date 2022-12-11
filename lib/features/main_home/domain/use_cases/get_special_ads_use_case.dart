import 'package:test_tarwej/features/main_home/domain/reposatories/home_repository.dart';

class GetSpecialAdsUseCase {
  final HomeRepository _homeRepository;

  GetSpecialAdsUseCase(this._homeRepository);

  Future<void>excute() async {
    await _homeRepository.getSpecialAds();
  }
}