import 'package:finance_tracker/features/add_entry/domain/use_cases/get_income_sources_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/income_and_expense/presentation/models/income_model.dart';
import '../../../domain/entities/expense_category_entity.dart';
import '../../../domain/use_cases/add_income_use_case.dart';
import '../../../domain/use_cases/get_expense_categories_use_case.dart';
import 'add_income_event.dart';
import 'add_income_state.dart';

class AddIncomeBloc extends Bloc<AddIncomeEvent, AddIncomeState> {
  final GetIncomeSourcesUseCase _getIncomeSourcesUseCase;
  final GetExpenseCategoriesUseCase _getExpenseCategoriesUseCase;
  final AddIncomeUseCase _addIncomeUseCase;

  AddIncomeBloc(
    this._getIncomeSourcesUseCase,
    this._getExpenseCategoriesUseCase,
    this._addIncomeUseCase,
  ) : super(AddIncomeState()) {
    on<SaveIncomeEvent>((event, emit) async {
      await _saveIncome(event, emit);
    });
  }

  int? _selectedCategoryIndex;
  int? _selectedIncomeSourceIndex;
  int _sum = 0;
  String? _selectedCategory;
  String? _selectedIncomeSource;
  String? _comment;

  Future<void> _saveIncome(
    SaveIncomeEvent event,
    Emitter<AddIncomeState> emit,
  ) async {
    emit(LoadingAddIncomeState());
    await Future.delayed(Duration(milliseconds: 500), () async {
      final incomeModel = IncomeModelUi(
        sum: _sum,
        category: _selectedCategory ?? 'Другое',
        incomeSource: _selectedIncomeSource ?? 'Другое',
        comment: _comment ?? 'Без комментария',
      ).toEntity();
      final result = await _addIncomeUseCase.call(incomeModel);
      result.fold(
        (failure) {
          emit(ErrorAddIncomeState(failure));
        },
        (success) {
          emit(SuccessAddIncomeState());
        },
      );
    });
  }

  List<CategoryEntity> getCategoriesList() =>
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

  void setSelectedIncomeSourceIndex(int? index) {
    _selectedIncomeSourceIndex = index;
  }

  int? getSelectedIncomeSourceIndex() => _selectedIncomeSourceIndex;

  void setSelectedIncomeSource(String? incomeSource) {
    _selectedIncomeSource = incomeSource;
  }
}
