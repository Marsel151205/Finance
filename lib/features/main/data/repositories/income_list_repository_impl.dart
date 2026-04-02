import 'package:finance_tracker/app/database/database.dart';
import 'package:finance_tracker/features/main/domain/repositories/income_list_repository.dart';
import 'package:finance_tracker/shared/data/models/income_data_extensions.dart';
import 'package:finance_tracker/shared/domain/entities/income_entity.dart';
import 'package:fpdart/fpdart.dart';

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
