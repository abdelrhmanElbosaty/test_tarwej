import 'package:test_tarwej/features/main_home/data/models/all_section/api_ads_result.dart';
import 'package:test_tarwej/features/main_home/data/models/all_section/api_featured_stores_result.dart' as store;

import '../../data/models/all_section/api_all_section_result.dart';

abstract class HomeRepository {
  Future<List<Category>> getAllSections();
  Future<List<store.Store>> getSpecialStores();
  Future<List<Ads>> getSpecialAds();
  Future<List<String>> getHotArrives();
  Future<List<String>> getMostSailed();
  Future<List<String>> getBestSales();
}