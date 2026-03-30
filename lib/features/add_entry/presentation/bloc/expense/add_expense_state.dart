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