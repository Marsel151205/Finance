import 'package:finance_tracker/features/main/domain/repositories/expense_list_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../shared/income_and_expense/domain/entities/expense_entity.dart';

class GetExpenseListUseCase {
  final ExpenseListRepository _repository;

  const GetExpenseListUseCase(this._repository);

  Future<Either<String, List<ExpenseEntity>>> call() async =>
      await _repository.getAll();
}
