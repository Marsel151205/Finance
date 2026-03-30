abstract class AddExpenseEvent {}

class SaveExpenseEvent extends AddExpenseEvent {
  final bool isUnnecessary;

  SaveExpenseEvent(this.isUnnecessary);
}
