import 'package:finance_tracker/shared/domain/entities/expense_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class ExpenseListRepository {
  Future<Either<String, List<ExpenseEntity>>> getAll();
}
