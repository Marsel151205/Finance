import 'package:finance_tracker/features/add_entry/domain/repositories/add_income_repository.dart';
import 'package:finance_tracker/shared/balance/domain/repositories/balance_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../shared/income_and_expense/domain/entities/income_entity.dart';

class AddIncomeUseCase {
  final AddIncomeRepository _addIncomeRepository;
  final BalanceRepository _balanceRepository;

  const AddIncomeUseCase(this._addIncomeRepository, this._balanceRepository);

  Future<Either<String, Unit>> call(IncomeEntity model) async {
    final balanceResult = await _balanceRepository.getBalance();
    final incomeResult = await _addIncomeRepository.addIncome(model);

    return balanceResult.fold((failure) => Left(failure), (balance) {
      return incomeResult.fold((failure) => Left(failure), (isSavedIncome) {
        _balanceRepository.saveBalance(balance.sum + model.sum);
        return Right(unit);
      });
    });
  }
}
