import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

class ExpenseItem extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get sum => integer()();

  TextColumn get category => text().nullable()();

  BoolColumn get isUnnecessary =>
      boolean().withDefault(const Constant(false))();

  TextColumn get comment => text().nullable()();
}

class IncomeItem extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get sum => integer()();

  TextColumn get category => text().nullable()();

  TextColumn get incomeSource => text().nullable()();

  TextColumn get comment => text().nullable()();
}

class BalanceItem extends Table {
  IntColumn get id => integer()();

  IntColumn get balance => integer()();

  DateTimeColumn get updateAt => dateTime()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

@DriftDatabase(tables: [ExpenseItem, IncomeItem, BalanceItem])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'finance_database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
