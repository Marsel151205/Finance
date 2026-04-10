import 'package:finance_tracker/features/create_balance/presentation/bloc/create_balance_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../shared/balance/domain/use_cases/add_balance_use_case.dart';
import 'create_balance_event.dart';

class CreateBalanceBloc extends Bloc<CreateBalanceEvent, CreateBalanceState> {
  final AddBalanceUseCase _addBalanceUseCase;

  CreateBalanceBloc(this._addBalanceUseCase) : super(CreateBalanceState()) {
    on<CreateNewBalanceEvent>((event, emit) async {
      await _addBalance(event, emit);
    });
  }

  Future<void> _addBalance(
    CreateNewBalanceEvent event,
    Emitter<CreateBalanceState> emit,
  ) async {
    emit(LoadingCreateBalanceState());
    await Future.delayed(Duration(milliseconds: 500), () async {
      final result = await _addBalanceUseCase.addBalance(event.sum);
      result.fold(
        (failure) => emit(ErrorCreateBalanceState(failure)),
        (success) => emit(SuccessCreateBalanceState()),
      );
    });
  }
}
