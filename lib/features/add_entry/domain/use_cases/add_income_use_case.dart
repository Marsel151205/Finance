import 'package:finance_tracker/features/add_entry/domain/repositories/add_income_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../shared/income_and_expense/domain/entities/income_entity.dart';

class AddIncomeUseCase {
  const AddIncomeUseCase(this._addIncomeRepository);

  final AddIncomeRepository _addIncomeRepository;

  Future<Either<String, Unit>> call(IncomeEntity model) =>
      _addIncomeRepository.addIncome(model);
}
