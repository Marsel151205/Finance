import '../../models/expense_model.dart';

abstract class ExpenseEvent {}

class SaveExpenseEvent extends ExpenseEvent {
  final ExpenseModelUi model;

  SaveExpenseEvent(this.model);
}
