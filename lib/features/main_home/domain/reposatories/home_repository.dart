import '../../data/models/all_section/api_all_section_result.dart';

abstract class HomeRepository {
  Future<List<Category>> getAllSections();
  Future<List<String>> getSpecialStores();
  Future<List<String>> getSpecialAds();
  Future<List<String>> getHotArrives();
  Future<List<String>> getMostSailed();
  Future<List<String>> getBestSales();
}