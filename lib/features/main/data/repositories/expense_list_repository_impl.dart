import 'package:finance_tracker/features/main/domain/repositories/expense_list_repository.dart';
import 'package:finance_tracker/shared/data/models/expense_data_extensions.dart';
import 'package:finance_tracker/shared/domain/entities/expense_entity.dart';
import 'package:fpdart/src/either.dart';

import '../../../../app/database/database.dart';

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
