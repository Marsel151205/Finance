class AddEntryState {
  final bool isExpenses;
  final String category;
  final bool isUnnecessary;

  const AddEntryState({
    this.isExpenses = true,
    this.category = '',
    this.isUnnecessary = false,
  });
}

class InitialState extends AddEntryState {
  const InitialState();
}

class SuccessState extends AddEntryState {
  final bool isSaved;

  const SuccessState(this.isSaved);
}

class ErrorState extends AddEntryState {
  final String errorMessage;

  const ErrorState(this.errorMessage);
}

class LoadingState extends AddEntryState {
  const LoadingState();
}
