import 'package:fpdart/fpdart.dart';

import '../../../../shared/income_and_expense/domain/entities/income_entity.dart';

abstract class IncomeListRepository {
  Future<Either<String, List<IncomeEntity>>> getIncomeList();
}
