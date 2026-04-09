import 'package:fpdart/fpdart.dart';

import '../../../../shared/income_and_expense/domain/entities/expense_entity.dart';

abstract class AddExpenseRepository {
  Future<Either<String, Unit>> add(ExpenseEntity model);
}
