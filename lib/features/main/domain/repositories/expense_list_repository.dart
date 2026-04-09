import 'package:fpdart/fpdart.dart';

import '../../../../shared/income_and_expense/domain/entities/expense_entity.dart';

abstract class ExpenseListRepository {
  Future<Either<String, List<ExpenseEntity>>> getAll();
}
