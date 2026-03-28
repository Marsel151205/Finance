abstract class ExpenseEvent {}

class SaveExpenseEvent extends ExpenseEvent {
  final bool isUnnecessary;

  SaveExpenseEvent(this.isUnnecessary);
}
