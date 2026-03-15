import 'package:finance_tracker/features/add_entry/domain/entities/expense_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class ExpenseRepository {
  Future<Either<String, List<ExpenseEntity>>> getAll();

  Future<Either<String, Unit>> add(ExpenseEntity model);
}
