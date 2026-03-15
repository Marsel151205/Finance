import 'package:finance_tracker/features/add_entry/presentation/bloc/expense/expense_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/add_expense_use_case.dart';
import '../../models/expense_model.dart';
import 'expense_event.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final AddExpenseUseCase _addExpenseUseCase;

  ExpenseBloc(this._addExpenseUseCase) : super(ExpenseState()) {
    on<SaveExpenseEvent>((event, emit) {
      _saveExpense(event, emit);
    });
  }

  Future<void> _saveExpense(
    SaveExpenseEvent event,
    Emitter<ExpenseState> emit,
  ) async {
    emit(LoadingExpenseState());
    try {
      final result = _addExpenseUseCase.call(event.model.toEntity());
      emit(SuccessExpenseState());
    } catch (e) {
      emit(ErrorExpenseState(e.toString()));
    }
  }
}
