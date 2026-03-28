import 'package:finance_tracker/shared/presentation/models/expense_model.dart';

class ExpenseListEvent {
  const ExpenseListEvent();
}

class ClickExpenseItemEvent extends ExpenseListEvent {
  final ExpenseModelUi model;

  const ClickExpenseItemEvent(this.model);
}

class GetExpenseListEvent extends ExpenseListEvent {
  const GetExpenseListEvent();
}