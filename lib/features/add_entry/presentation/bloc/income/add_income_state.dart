import 'package:finance_tracker/shared/category/presentation/models/category_model_ui.dart';

class AddIncomeState {
  const AddIncomeState();
}

class SuccessAddIncomeState extends AddIncomeState {
  const SuccessAddIncomeState();
}

class LoadingAddIncomeState extends AddIncomeState {
  const LoadingAddIncomeState();
}

class ErrorAddIncomeState extends AddIncomeState {
  final String errorMessage;

  const ErrorAddIncomeState(this.errorMessage);
}

class SuccessUploadIncomeCategoriesState extends AddIncomeState {
  final List<CategoryModelUi> categories;

  const SuccessUploadIncomeCategoriesState(this.categories);
}
