import 'package:fpdart/fpdart.dart';

import '../entities/balance_entity.dart';

abstract class BalanceRepository {
  Future<Either<String, Unit>> saveBalance(int sum);

  Future<Either<String, BalanceEntity>> getBalance();
}
