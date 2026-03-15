import 'package:finance_tracker/features/add_entry/domain/entities/expense_entity.dart';

abstract class ExpenseRepository {
  
  Future<List<ExpenseEntity>> getAll();

  Future<void> add(ExpenseEntity model);
}
