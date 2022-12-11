import 'package:bloc/bloc.dart';
import 'package:test_tarwej/features/main_home/data/models/all_section/api_all_section_result.dart';
import 'package:test_tarwej/features/main_home/domain/use_cases/get_all_section_use_case.dart';
import 'package:test_tarwej/utils/exception_errors.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getAlLSectionUseCase) : super(HomeInitial());

  final GetAlLSectionUseCase _getAlLSectionUseCase;

  void getAllCategory() async {
    emit(HomeCategoryLoading());

    await collect(
      task: () async {
        final category = await _getAlLSectionUseCase.excute();
        emit(HomeCategorySuccess(category));
      },
      onError: (error) {
        emit(HomeCategoryError(error));
      },
    );
  }
}
