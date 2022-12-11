import 'package:test_tarwej/features/main_home/domain/reposatories/home_repository.dart';

class GetBestSalesUseCase {
  final HomeRepository _homeRepository;

  GetBestSalesUseCase(this._homeRepository);

  Future<void>excute () async {
    await _homeRepository.getBestSales();
  }
}