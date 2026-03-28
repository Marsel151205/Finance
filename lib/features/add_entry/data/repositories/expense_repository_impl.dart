import 'package:drift/drift.dart';
import 'package:finance_tracker/shared/domain/entities/expense_entity.dart';
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
}
