import 'package:finance_tracker/shared/balance/domain/repositories/balance_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddBalanceUseCase {
  final BalanceRepository _repository;

  const AddBalanceUseCase(this._repository);

  Future<Either<String, Unit>> addBalance(int? sum) async {
    final preferences = await SharedPreferences.getInstance();
    if (sum != null) {
      final saveBalanceResult = await _repository.saveBalance(sum);
      return saveBalanceResult.fold((failure) => Left(failure), (
        isSaveBalance,
      ) {
        preferences.setBool('isBalanceCreated', true);
        return Right(unit);
      });
    } else {
      return Future.value(Left('Введите Баланс'));
    }
  }
}
