import 'package:finance_tracker/shared/category/presentation/models/category_model_ui.dart';

class AddExpenseState {
  const AddExpenseState();
}

class LoadingAddExpenseState extends AddExpenseState {
  const LoadingAddExpenseState();
}

class SuccessAddExpenseState extends AddExpenseState {
  const SuccessAddExpenseState();
}

class ErrorAddExpenseState extends AddExpenseState {
  final String errorMessage;

  const ErrorAddExpenseState(this.errorMessage);
}

class SuccessUploadExpenseCategoriesState extends AddExpenseState {
  final List<CategoryModelUi> expenseCategories;

  const SuccessUploadExpenseCategoriesState(this.expenseCategories);
}
