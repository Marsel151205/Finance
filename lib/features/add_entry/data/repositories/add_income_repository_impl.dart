import 'package:drift/drift.dart';
import 'package:finance_tracker/shared/domain/entities/income_entity.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../app/database/database.dart';
import '../../domain/repositories/add_income_repository.dart';

class AddIncomeRepositoryImpl extends AddIncomeRepository {
  AddIncomeRepositoryImpl(this._appDatabase);

  final AppDatabase _appDatabase;

  @override
  Future<Either<String, Unit>> addIncome(IncomeEntity model) async {
    try {
      await _appDatabase
          .into(_appDatabase.incomeItem)
          .insert(
            IncomeItemCompanion.insert(
              sum: model.sum,
              category: Value(model.category),
              incomeSource: Value(model.incomeSource),
              comment: Value(model.comment),
            ),
          );
      return Right(unit);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
