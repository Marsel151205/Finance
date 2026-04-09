
import '../../../../../shared/income_and_expense/presentation/models/expense_model.dart';

class ExpenseListState {
  const ExpenseListState();
}

class SuccessExpenseListState extends ExpenseListState {
  final List<ExpenseModelUi> model;

  const SuccessExpenseListState(this.model);
}

class LoadingExpenseListState extends ExpenseListState {
  const LoadingExpenseListState();
}

class ErrorExpenseListState extends ExpenseListState {
  final String errorMessage;

  const ErrorExpenseListState(this.errorMessage);
}
