import 'package:fpdart/fpdart.dart';

import '../../../../shared/domain/entities/income_entity.dart';

abstract class AddIncomeRepository {
  Future<Either<String, Unit>> addIncome(IncomeEntity model);
}