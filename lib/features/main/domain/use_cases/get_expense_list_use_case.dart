import 'package:finance_tracker/features/main/domain/repositories/expense_list_repository.dart';
import 'package:finance_tracker/shared/domain/entities/expense_entity.dart';
import 'package:fpdart/fpdart.dart';

class GetExpenseListUseCase {
  final ExpenseListRepository _repository;

  const GetExpenseListUseCase(this._repository);

  Future<Either<String, List<ExpenseEntity>>> call() async =>
      await _repository.getAll();
}
