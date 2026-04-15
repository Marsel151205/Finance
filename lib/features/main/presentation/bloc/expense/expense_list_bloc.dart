import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/income_and_expense/presentation/models/expense_model.dart';
import '../../../domain/use_cases/get_expense_list_use_case.dart';
import 'expense_list_event.dart';
import 'expense_list_state.dart';

class ExpenseListBloc extends Bloc<ExpenseListEvent, ExpenseListState> {
  final GetExpenseListUseCase _getExpenseListUseCase;

  ExpenseListBloc(this._getExpenseListUseCase)
    : super(LoadingExpenseListState()) {
    on<GetExpenseListEvent>((event, emit) => _getExpenseList(event, emit));

    on<ClickExpenseItemEvent>((event, emit) {
      // Logic of clicking on an item
    });
    add(GetExpenseListEvent());
  }

  Future<void> _getExpenseList(
    GetExpenseListEvent event,
    Emitter<ExpenseListState> emit,
  ) async {
    emit(LoadingExpenseListState());
    final result = await _getExpenseListUseCase.call();
    result.fold(
      (failure) => emit(ErrorExpenseListState(failure)),
      (success) => emit(
        SuccessExpenseListState(success.map((e) => e.toModelUi()).toList().reversed.toList()),
      ),
    );
  }
}
