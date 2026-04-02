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
