import 'package:test_tarwej/di.dart';
import 'package:test_tarwej/features/main_home/data/repository_imp/main_home_repository_imp.dart';
import 'package:test_tarwej/features/main_home/domain/reposatories/home_repository.dart';
import 'package:test_tarwej/features/main_home/domain/use_cases/get_all_section_use_case.dart';
import 'package:test_tarwej/features/main_home/domain/use_cases/get_best_sales_use_case.dart';
import 'package:test_tarwej/features/main_home/domain/use_cases/get_hot_arrives_use_case.dart';
import 'package:test_tarwej/features/main_home/domain/use_cases/get_most_sailed_use_case.dart';
import 'package:test_tarwej/features/main_home/domain/use_cases/get_special_ads_use_case.dart';
import 'package:test_tarwej/features/main_home/domain/use_cases/get_special_stores_use_case.dart';

class HomeDi {
  static Future<void>initialize() async {
    injector.registerFactory(() => GetAlLSectionUseCase(injector()));
    injector.registerFactory(() => GetBestSalesUseCase(injector()));
    injector.registerFactory(() => GetHotArrivesUseCase(injector()));
    injector.registerFactory(() => GetMostSailedUseCase(injector()));
    injector.registerFactory(() => GetSpecialAdsUseCase(injector()));
    injector.registerFactory(() => GetSpecialStoresUseCase(injector()));

    injector.registerFactory<HomeRepository>(() => MainHomeRepositoryImp(injector()));
  }
}