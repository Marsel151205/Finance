abstract class AddEntryEvent {}

class SaveIsExpenseEvent extends AddEntryEvent {
  final bool isExpense;

  SaveIsExpenseEvent(this.isExpense);
}

class SaveCategoryEvent extends AddEntryEvent {
  final String category;

  SaveCategoryEvent(this.category);
}

class SaveIsUnnecessaryEvent extends AddEntryEvent {
  final bool isUnnecessary;

  SaveIsUnnecessaryEvent(this.isUnnecessary);
}

class SaveExpenseEvent extends AddEntryEvent {
  final int sum;
  final String comment;

  SaveExpenseEvent(this.sum, this.comment);
}
