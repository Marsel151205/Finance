class CreateBalanceState {
  const CreateBalanceState();
}

class LoadingCreateBalanceState extends CreateBalanceState {
  const LoadingCreateBalanceState();
}

class ErrorCreateBalanceState extends CreateBalanceState {
  final String errorMessage;

  const ErrorCreateBalanceState(this.errorMessage);
}

class SuccessCreateBalanceState extends CreateBalanceState {
  const SuccessCreateBalanceState();
}
