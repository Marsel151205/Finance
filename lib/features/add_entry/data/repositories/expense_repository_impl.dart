import 'package:drift/drift.dart';
import 'package:finance_tracker/features/add_entry/data/models/expense_data_extensions.dart';
import 'package:finance_tracker/features/add_entry/domain/entities/expense_entity.dart';
import 'package:finance_tracker/features/add_entry/domain/repositories/add_expense_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../app/database/database.dart';

class ExpenseRepositoryImpl implements ExpenseRepository {
  final AppDatabase appDatabase;

  ExpenseRepositoryImpl(this.appDatabase);

  @override
  Future<Either<String, Unit>> add(ExpenseEntity model) async {
    try {
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
      return Right(unit);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ExpenseEntity>>> getAll() async {
    try {
      final items = await appDatabase.select(appDatabase.expenseItem).get();
      return Right(items.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
