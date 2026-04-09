import 'package:finance_tracker/shared/balance/domain/repositories/balance_repository.dart';
import 'package:fpdart/fpdart.dart';

class AddBalanceUseCase {
  final BalanceRepository _repository;

  const AddBalanceUseCase(this._repository);

  Future<Either<String, Unit>> addBalance(int? sum) {
    if (sum != null) {
      return _repository.saveBalance(sum);
    } else {
      return Future.value(Left('Введите Баланс'));
    }
  }
}
