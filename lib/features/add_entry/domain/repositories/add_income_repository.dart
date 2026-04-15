import 'package:fpdart/fpdart.dart';

import '../../../../shared/income_and_expense/domain/entities/income_entity.dart';

abstract class AddIncomeRepository {
  Future<Either<String, Unit>> addIncome(IncomeEntity model);
}