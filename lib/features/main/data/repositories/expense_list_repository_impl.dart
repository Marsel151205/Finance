import 'package:finance_tracker/features/main/domain/repositories/expense_list_repository.dart';
import 'package:fpdart/src/either.dart';

import '../../../../app/database/database.dart';
import '../../../../shared/income_and_expense/data/models/expense_data_extensions.dart';
import '../../../../shared/income_and_expense/domain/entities/expense_entity.dart';

class ExpenseListRepositoryImpl extends ExpenseListRepository {
  final AppDatabase appDatabase;

  ExpenseListRepositoryImpl(this.appDatabase);

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
