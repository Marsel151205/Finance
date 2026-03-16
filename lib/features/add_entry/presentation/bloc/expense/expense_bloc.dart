import 'package:finance_tracker/features/add_entry/domain/entities/expense_category_entity.dart';
import 'package:finance_tracker/features/add_entry/presentation/bloc/expense/expense_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/add_expense_use_case.dart';
import '../../../domain/use_cases/get_expense_categories_use_case.dart';
import '../../models/expense_model.dart';
import 'expense_event.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final AddExpenseUseCase _addExpenseUseCase;
  final GetExpenseCategoriesUseCase _getExpenseCategoriesUseCase;

  ExpenseBloc(this._addExpenseUseCase, this._getExpenseCategoriesUseCase)
    : super(ExpenseState()) {
    on<SaveExpenseEvent>((event, emit) {
      _saveExpense(event, emit);
    });
  }

  Future<void> _saveExpense(
    SaveExpenseEvent event,
    Emitter<ExpenseState> emit,
  ) async {
    emit(LoadingExpenseState());
    final result = await _addExpenseUseCase.call(event.model.toEntity());
    result.fold(
      (error) => emit(ErrorExpenseState(error)),
      (success) => emit(SuccessExpenseState()),
    );
  }

  List<ExpenseCategoryEntity> getExpenseCategories() =>
      _getExpenseCategoriesUseCase.getExpenseCategories();
}
