import 'package:finance_tracker/features/create_balance/domain/use_cases/create_categories_use_case.dart';
import 'package:finance_tracker/features/create_balance/presentation/bloc/create_balance_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/balance/domain/use_cases/add_balance_use_case.dart';
import 'create_balance_event.dart';

class CreateBalanceBloc extends Bloc<CreateBalanceEvent, CreateBalanceState> {
  final AddBalanceUseCase _addBalanceUseCase;
  final CreateCategoriesUseCase _createCategoriesUseCase;

  CreateBalanceBloc(this._addBalanceUseCase, this._createCategoriesUseCase)
    : super(CreateBalanceState()) {
    on<CreateNewBalanceEvent>((event, emit) async {
      await _addBalance(event, emit);
    });
  }

  Future<void> _addBalance(
    CreateNewBalanceEvent event,
    Emitter<CreateBalanceState> emit,
  ) async {
    emit(LoadingCreateBalanceState());
    final createCategoriesResult = await _createCategoriesUseCase.call();
    final result = await _addBalanceUseCase.addBalance(event.sum);

    await Future.delayed(Duration(milliseconds: 500), () async {
      createCategoriesResult.fold(
        (failure) => emit(ErrorCreateBalanceState(failure)),
        (createCategories) {
          result.fold(
            (failure) => emit(ErrorCreateBalanceState(failure)),
            (success) => emit(SuccessCreateBalanceState()),
          );
        },
      );
    });
  }
}
