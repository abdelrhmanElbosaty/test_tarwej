import 'package:test_tarwej/features/main_home/data/models/all_section/api_ads_result.dart';
import 'package:test_tarwej/features/main_home/domain/reposatories/home_repository.dart';

class GetSpecialAdsUseCase {
  final HomeRepository _homeRepository;

  GetSpecialAdsUseCase(this._homeRepository);

  Future<List<Ads>>excute() async {
   return  await _homeRepository.getSpecialAds();
  }
}