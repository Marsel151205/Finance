import 'package:drift/drift.dart';
import 'package:finance_tracker/features/add_entry/data/models/expense_data_extensions.dart';
import 'package:finance_tracker/features/add_entry/domain/entities/expense_entity.dart';
import 'package:finance_tracker/features/add_entry/domain/repositories/add_expense_repository.dart';

import '../../../../app/database/database.dart';

class ExpenseRepositoryImpl implements ExpenseRepository {
  final AppDatabase appDatabase;

  ExpenseRepositoryImpl(this.appDatabase);

  @override
  Future<void> add(ExpenseEntity model) async {
    await appDatabase
        .into(appDatabase.expenseItem)
        .insert(
          ExpenseItemCompanion.insert(
            sum: model.sum,
            category: Value(model.category),
            comment: Value(model.comment),
            isUnnecessary: Value(model.isUnnecessary),
          ),
        );
  }

  @override
  Future<List<ExpenseEntity>> getAll() async {
    final items = await appDatabase.select(appDatabase.expenseItem).get();
    return items.map((e) => e.toEntity()).toList();
  }
}
