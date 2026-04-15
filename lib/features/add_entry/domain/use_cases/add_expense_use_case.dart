import 'package:finance_tracker/features/add_entry/domain/repositories/add_expense_repository.dart';
import 'package:finance_tracker/shared/balance/domain/repositories/balance_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../shared/income_and_expense/domain/entities/expense_entity.dart';

class AddExpenseUseCase {
  final AddExpenseRepository _addExpenseRepository;
  final BalanceRepository _balanceRepository;

  AddExpenseUseCase(this._addExpenseRepository, this._balanceRepository);

  Future<Either<String, Unit>> call(ExpenseEntity model) async {
    final addExpenseResult = await _addExpenseRepository.add(model);
    final balanceResult = await _balanceRepository.getBalance();
    return balanceResult.fold((failure) => Left(failure), (balance) {
      return addExpenseResult.fold((failure) => Left(failure), (
        isSavedExpense,
      ) {
        _balanceRepository.saveBalance(balance.sum - model.sum);
        return Right(unit);
      });
    });
  }
}
