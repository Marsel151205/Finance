import 'package:finance_tracker/features/add_entry/domain/repositories/add_expense_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../shared/income_and_expense/domain/entities/expense_entity.dart';

class AddExpenseUseCase {
  final AddExpenseRepository repository;

  AddExpenseUseCase(this.repository);

  Future<Either<String, Unit>> call(ExpenseEntity model) async {
    return repository.add(model);
  }
}
