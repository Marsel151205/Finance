import 'package:drift/drift.dart';
import 'package:finance_tracker/features/add_entry/domain/repositories/add_expense_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../app/database/database.dart';
import '../../../../shared/income_and_expense/domain/entities/expense_entity.dart';

class AddExpenseRepositoryImpl implements AddExpenseRepository {
  final AppDatabase appDatabase;

  AddExpenseRepositoryImpl(this.appDatabase);

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
