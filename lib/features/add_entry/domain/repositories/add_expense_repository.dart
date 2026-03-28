import 'package:finance_tracker/shared/domain/entities/expense_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class ExpenseRepository {
  Future<Either<String, Unit>> add(ExpenseEntity model);
}
