import 'package:finance_tracker/features/add_entry/presentation/bloc/expense/add_expense_state.dart';
import 'package:finance_tracker/shared/category/presentation/models/category_model_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/income_and_expense/presentation/models/expense_model.dart';
import '../../../domain/use_cases/add_expense_use_case.dart';
import '../../../domain/use_cases/get_expense_categories_use_case.dart';
import 'add_expense_event.dart';

class AddExpenseBloc extends Bloc<AddExpenseEvent, AddExpenseState> {
  final AddExpenseUseCase _addExpenseUseCase;
  final GetExpenseCategoriesUseCase _getExpenseCategoriesUseCase;

  AddExpenseBloc(this._addExpenseUseCase, this._getExpenseCategoriesUseCase)
    : super(AddExpenseState()) {
    on<SaveExpenseEvent>((event, emit) async {
      await _saveExpense(event, emit);
    });
    on<UploadExpenseCategoriesEvent>((event, emit) async {
      await _uploadExpenseCategories(event, emit);
    });
    add(UploadExpenseCategoriesEvent());
  }

  int _sum = 0;
  String _selectedCategory = 'Без названия';
  String _comment = '';

  Future<void> _saveExpense(
    SaveExpenseEvent event,
    Emitter<AddExpenseState> emit,
  ) async {
    emit(LoadingAddExpenseState());
    await Future.delayed(Duration(milliseconds: 500), () async {
      final model = ExpenseModelUi(
        sum: _sum,
        category: _selectedCategory,
        isUnnecessary: event.isUnnecessary,
        comment: _comment,
      );
      final result = await _addExpenseUseCase.call(model.toEntity());
      result.fold(
        (error) => emit(ErrorAddExpenseState(error)),
        (success) => emit(SuccessAddExpenseState()),
      );
    });
  }

  Future<void> _uploadExpenseCategories(
    UploadExpenseCategoriesEvent event,
    Emitter<AddExpenseState> emit,
  ) async {
    emit(LoadingAddExpenseState());
    final expenseCategoriesResult = await _getExpenseCategoriesUseCase
        .getExpenseCategories();

    return expenseCategoriesResult.fold(
      (failure) => emit(ErrorAddExpenseState(failure)),
      (expenseCategories) => emit(
        SuccessUploadExpenseCategoriesState(
          expenseCategories.map((category) => category.toModelUi()).toList(),
        ),
      ),
    );
  }

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
