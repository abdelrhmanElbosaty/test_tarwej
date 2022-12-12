import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test_tarwej/features/main_home/data/graphql/home_graphql.dart';
import 'package:test_tarwej/features/main_home/data/models/all_section/api_ads_result.dart';
import 'package:test_tarwej/features/main_home/data/models/all_section/api_all_section_result.dart';
import 'package:test_tarwej/features/main_home/data/models/all_section/api_featured_stores_result.dart' as store;
import 'package:test_tarwej/features/main_home/domain/reposatories/home_repository.dart';
import 'package:test_tarwej/utils/exception_errors.dart';
import 'package:test_tarwej/utils/graphql_extensions.dart';

class MainHomeRepositoryImp implements HomeRepository {
  final GraphQLClient _graphQLClient;

  MainHomeRepositoryImp(this._graphQLClient);

  @override
  Future<List<Category>> getAllSections() async {
    try {
      final result = await _graphQLClient.fetch(query: categoryQuery);

      if (result.hasException || result.data == null) {
        throw const ServerException();
      } else {
        final request = APiAllSectionResult.fromJson(result.data!).sections;

        if (request?.code == 200 || request?.data != null) {
          return request?.data! ?? [];
        } else {
          throw ApiRequestException(request?.code ?? 0, request?.message ?? '');
        }
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  @override
  Future<List<store.Store>> getSpecialStores() async {
    final result = await _graphQLClient.fetch(query: featuredStoresQuery);

    if (result.hasException || result.data == null) {
      throw const ServerException();
    } else {
      final request = store.APiFeatureStoresResult.fromJson(result.data!).stores;

      if (request?.code == 200 || request?.data != null) {
        final stores = request?.data?.items ?? [];
        return stores ;
      } else {
        throw ApiRequestException(request?.code ?? 0, request?.message ?? '');
      }
    }
  }

  @override
  Future<List<Ads>> getSpecialAds() async {
    final result = await _graphQLClient.fetch(query: adsQuery);

    if (result.hasException || result.data == null) {
      throw const ServerException();
    } else {
      final request = APiAdsResult.fromJson(result.data!).advertisements;

      if (request?.code == 200 || request?.data != null) {
        final ads = request?.data?.items ?? [];
            return ads;
      } else {
        throw ApiRequestException(request?.code ?? 0, request?.message ?? '');
      }
    }
  }

  @override
  Future<List<String>> getBestSales() {
    // TODO: implement getBestSales
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getHotArrives() {
    // TODO: implement getHotArrives
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getMostSailed() {
    // TODO: implement getMostSailed
    throw UnimplementedError();
  }
}
