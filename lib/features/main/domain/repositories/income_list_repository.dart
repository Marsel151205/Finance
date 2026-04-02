import 'package:finance_tracker/shared/domain/entities/income_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class IncomeListRepository {
  Future<Either<String, List<IncomeEntity>>> getIncomeList();
}
