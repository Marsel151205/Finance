import 'package:finance_tracker/features/main/presentation/bloc/expense_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/get_expense_list_use_case.dart';
import 'expense_list_event.dart';

class ExpenseListBloc extends Bloc<ExpenseListEvent, ExpenseListState> {
  final GetExpenseListUseCase _getExpenseListUseCase;

  ExpenseListBloc(this._getExpenseListUseCase)
    : super(LoadingExpenseListState()) {
    add(GetExpenseListEvent());
    on<GetExpenseListEvent>((event, emit) {
      _getExpenseList(event, emit);
    });
    on<ClickExpenseItemEvent>((event, emit) {
      // Logic of clicking on an item
    });
  }

  Future<void> _getExpenseList(
    GetExpenseListEvent event,
    Emitter<ExpenseListState> emit,
  ) async {}
}
