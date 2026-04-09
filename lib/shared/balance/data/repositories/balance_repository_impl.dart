import 'package:drift/drift.dart';
import 'package:finance_tracker/app/database/database.dart';
import 'package:finance_tracker/shared/balance/data/models/balance_data_extensions.dart';
import 'package:finance_tracker/shared/balance/domain/entities/balance_entity.dart';
import 'package:finance_tracker/shared/balance/domain/repositories/balance_repository.dart';
import 'package:fpdart/fpdart.dart';

class BalanceRepositoryImpl extends BalanceRepository {
  BalanceRepositoryImpl(this._database);

  final AppDatabase _database;

  @override
  Future<Either<String, BalanceEntity>> getBalance() async {
    try {
      final result = await _database.select(_database.balanceItem).get();
      return Right(result.map((e) => e.toEntity()).first);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> saveBalance(int sum) async {
    try {
      await _database
          .into(_database.balanceItem)
          .insertOnConflictUpdate(
            BalanceItemCompanion(
              id: const Value(1),
              balance: Value(sum),
              updateAt: Value(DateTime.now()),
            ),
          );
      return Right(unit);
    } catch (e) {
      return Left(e.toString());
    }
  }
}