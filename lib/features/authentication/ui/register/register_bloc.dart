
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_tarwej/di.dart';
import 'package:test_tarwej/features/authentication/domain/uae_cases/register_use_case.dart';
import 'package:test_tarwej/features/authentication/ui/register/register_event.dart';

import '../../../../utils/exception_errors.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {

  late RegisterUseCase _registerUseCase;

  RegisterBloc() : super(RegisterInitial()) {
    _di();
    on<RegisterSubmit>(_register);
  }
  void _di(){
    _registerUseCase = injector<RegisterUseCase>();
  }

  void _register(RegisterSubmit event, Emitter<RegisterState> emit ) async {

    emit(RegisterLoading());

    await collect(task: () async {
      await _registerUseCase.excute(event.input);
      emit(RegisterSuccess(event.input.phone));
    },onError: (error) {
      emit(RegisterFailure(error));
      },
    );
  }
}
