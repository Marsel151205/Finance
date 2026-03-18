import 'package:finance_tracker/features/add_entry/domain/entities/expense/expense_category_entity.dart';
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
    on<SaveExpenseEvent>((event, emit) async {
      await _saveExpense(event, emit);
    });
  }

  int _sum = 0;
  String _selectedCategory = 'Без названия';
  String _comment = '';

  Future<void> _saveExpense(
    SaveExpenseEvent event,
    Emitter<ExpenseState> emit,
  ) async {
    emit(LoadingExpenseState());
    await Future.delayed(Duration(milliseconds: 500), () async {
      final model = ExpenseModelUi(
        sum: _sum,
        category: _selectedCategory,
        isUnnecessary: event.isUnnecessary,
        comment: _comment,
      );
      final result = await _addExpenseUseCase.call(model.toEntity());
      result.fold(
        (error) => emit(ErrorExpenseState(error)),
        (success) => emit(SuccessExpenseState()),
      );
    });
  }

  List<ExpenseCategoryEntity> getExpenseCategories() =>
      _getExpenseCategoriesUseCase.getExpenseCategories();

  void setSum(int sum) {
    _sum = sum;
  }

  void setSelectedCategory(String category) {
    _selectedCategory = category;
  }

  void setComment(String comment) {
    _comment = comment;
  }
}
