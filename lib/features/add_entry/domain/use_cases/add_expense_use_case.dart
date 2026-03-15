import 'package:finance_tracker/features/add_entry/domain/repositories/add_expense_repository.dart';

import '../entities/expense_entity.dart';

class AddExpenseUseCase {
  final ExpenseRepository repository;

  AddExpenseUseCase(this.repository);

  Future<void> call(ExpenseEntity model) async {
    repository.add(model);
  }
}
