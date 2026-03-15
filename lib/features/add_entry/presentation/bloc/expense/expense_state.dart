class ExpenseState {
  const ExpenseState();
}

class LoadingExpenseState extends ExpenseState {
  const LoadingExpenseState();
}

class SuccessExpenseState extends ExpenseState {
  const SuccessExpenseState();
}

class ErrorExpenseState extends ExpenseState {
  final String errorMessage;
  const ErrorExpenseState(this.errorMessage);
}