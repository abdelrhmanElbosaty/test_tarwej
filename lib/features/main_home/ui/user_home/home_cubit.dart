import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_tarwej/features/main_home/data/models/all_section/api_ads_result.dart';
import 'package:test_tarwej/features/main_home/data/models/all_section/api_all_section_result.dart';
import 'package:test_tarwej/features/main_home/domain/use_cases/get_all_section_use_case.dart';
import 'package:test_tarwej/features/main_home/domain/use_cases/get_special_ads_use_case.dart';
import 'package:test_tarwej/features/main_home/domain/use_cases/get_special_stores_use_case.dart';
import 'package:test_tarwej/features/main_home/data/models/all_section/api_featured_stores_result.dart'
    as s;
import 'package:test_tarwej/utils/async.dart';
import 'package:test_tarwej/utils/exception_errors.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getAlLSectionUseCase, this._getSpecialStoresUseCase,
      this._getSpecialAdsUseCase)
      : super(const HomeState.initial());

  final GetAlLSectionUseCase _getAlLSectionUseCase;
  final GetSpecialStoresUseCase _getSpecialStoresUseCase;
  final GetSpecialAdsUseCase _getSpecialAdsUseCase;

  void getAllCategory() async {
    emit(state.reduce(category: const Async.loading()));

    await collect(
      task: () async {
        final result = await _getAlLSectionUseCase.excute();
        emit(state.reduce(category: Async.success(result)));
      },
      onError: (error) {
        emit(state.reduce(errorMessage: error, category: Async.failure(error)));
      },
    );
  }

  void getFeaturedStores() async {
    // emit(HomeFeaturedStoresLoading());
    //
    // await collect(task: () async {
    //   final store = await _getSpecialStoresUseCase.excute();
    //   emit(HomeFeaturedStoresSuccess(store));
    // }, onError: (error) {
    //   emit(HomeFeaturedStoresError(error));
    // });

    emit(state.reduce(store: const Async.loading()));

    await collect(task: () async {
      final result = await _getSpecialStoresUseCase.excute();
      emit(state.reduce(store: Async.success(result)));
    }, onError: (error) {
      emit(state.reduce(errorMessage: error, store: Async.failure(error)));
    });
  }

  void getAds() async {
    emit(state.reduce(ads: const Async.loading()));

    await collect(task: () async {
      final result = await _getSpecialAdsUseCase.excute();
      emit(state.reduce(ads: Async.success(result)));
    }, onError: (error) {
      emit(state.reduce(errorMessage: error, ads: Async.failure(error)));
    });
  }
}
