class AddEntryState {
  final bool isExpenses;
  final String category;
  final bool isUnnecessary;

  const AddEntryState({
    this.isExpenses = true,
    this.category = '',
    this.isUnnecessary = false,
  });

  AddEntryState copyWith({
    bool? isExpenses,
    int? sum,
    String? category,
    bool? isUnnecessary,
    String? comment,
  }) {
    return AddEntryState(
      isExpenses: isExpenses ?? this.isExpenses,
      category: category ?? this.category,
      isUnnecessary: isUnnecessary ?? this.isUnnecessary,
    );
  }
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
