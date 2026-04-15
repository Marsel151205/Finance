import 'package:finance_tracker/shared/balance/domain/repositories/balance_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/balance_entity.dart';

class GetBalanceUseCase {
  final BalanceRepository _repository;

  const GetBalanceUseCase(this._repository);

  Future<Either<String, BalanceEntity>> getBalance() async =>
      await _repository.getBalance();
}
