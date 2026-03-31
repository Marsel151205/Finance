import 'package:finance_tracker/features/add_entry/domain/use_cases/get_income_sources_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/expense_category_entity.dart';
import '../../../domain/use_cases/get_expense_categories_use_case.dart';
import 'add_income_event.dart';
import 'add_income_state.dart';

class AddIncomeBloc extends Bloc<AddIncomeEvent, AddIncomeState> {
  final GetIncomeSourcesUseCase _getIncomeSourcesUseCase;
  final GetExpenseCategoriesUseCase _getExpenseCategoriesUseCase;

  AddIncomeBloc(
    this._getIncomeSourcesUseCase,
    this._getExpenseCategoriesUseCase,
  ) : super(AddIncomeState()) {
    on<SaveIncomeEvent>((event, emit) {
      emit(LoadingAddIncomeState());
    });
  }

  int? _selectedCategoryIndex;
  int _sum = 0;
  String _selectedCategory = 'Без категории';
  String _comment = 'Без комментария';

  List<ExpenseCategoryEntity> getCategoriesList() =>
      _getExpenseCategoriesUseCase.getExpenseCategories();

  List<String> getIncomeSourcesList() =>
      _getIncomeSourcesUseCase.getIncomeSources();

  void setSum(int sum) {
    _sum = sum;
  }

  void setSelectedCategory(String category) {
    _selectedCategory = category;
  }

  void setComment(String comment) {
    _comment = comment;
  }

  void setSelectedCategoryIndex(int? selectedIndex) {
    _selectedCategoryIndex = selectedIndex;
  }

  int? getSelectedCategoryIndex() {
    return _selectedCategoryIndex;
  }
}
