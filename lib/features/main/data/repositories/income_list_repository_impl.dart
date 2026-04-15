import 'package:finance_tracker/app/database/database.dart';
import 'package:finance_tracker/features/main/domain/repositories/income_list_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../shared/income_and_expense/data/models/income_data_extensions.dart';
import '../../../../shared/income_and_expense/domain/entities/income_entity.dart';

class IncomeListRepositoryImpl extends IncomeListRepository {
  IncomeListRepositoryImpl(this._appDatabase);

  final AppDatabase _appDatabase;

  @override
  Future<Either<String, List<IncomeEntity>>> getIncomeList() async {
    try {
      final items = await _appDatabase.select(_appDatabase.incomeItem).get();
      return Right(items.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
